package br.com.arduino.websocket.notify

import br.com.arduino.websocket.handler.AppWebSocketHandler
import br.com.arduino.websocket.json.JsonParser
import br.com.arduino.websocket.loader.WebSocketLightsSessionLoader
import br.com.arduino.websocket.message.LightStatus
import com.softwareplace.json.logger.log.JsonLog
import com.softwareplace.json.logger.log.kLogger
import org.slf4j.event.Level
import org.springframework.web.socket.CloseStatus
import org.springframework.web.socket.TextMessage
import org.springframework.web.socket.WebSocketSession


class LightChangeNotify(
    private val jsonParser: JsonParser,
    private val sessionLoader: WebSocketLightsSessionLoader,
    private val listenerChannel: ListenerChannel,
) : AppWebSocketHandler() {

    override fun path(): String = "v1/lights"

    override fun handleTextMessage(session: WebSocketSession, message: TextMessage) {
        val socketMessage = jsonParser.fromJson(message.asBytes(), messageTypeRef())
        sessionLoader.store(socketMessage, session)
        if (socketMessage.fistMessage) {
            JsonLog(kLogger)
                .level(Level.INFO)
                .message("A new light successful connect")
                .add("sessionId", session.id)
                .add("lightId", socketMessage.lightId)
                .add("lightName", socketMessage.lightName)
                .run()
        }

        sessionLoader.getSessions().forEach { listenerChannel.onLightStateChanged(it.first) }
    }

    override fun afterConnectionClosed(session: WebSocketSession, status: CloseStatus) {
        sessionLoader.findBy(session)?.let {
            listenerChannel.onLightConnectionLost(it.first);
        }
        sessionLoader.remove(session)
        JsonLog(kLogger)
            .level(Level.INFO)
            .message("Lost a light connection")
            .add("sessionId", session.id)
            .run()
    }

    fun changeLightsStatus(lightsId: List<String>, status: LightStatus) {
        val message = jsonParser.toJson(mapOf("status" to status))
        lightsId.forEach {
            sessionLoader.getSessions().forEach { client ->
                if (client.first.lightId == it) {
                    client.second.sendMessage(TextMessage(message))
                }
            }
        }
    }
}
