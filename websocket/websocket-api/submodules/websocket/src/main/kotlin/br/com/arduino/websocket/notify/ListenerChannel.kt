package br.com.arduino.websocket.notify

import br.com.arduino.websocket.handler.AppWebSocketHandler
import br.com.arduino.websocket.json.JsonParser
import br.com.arduino.websocket.loader.WebSocketLightsSessionLoader
import br.com.arduino.websocket.message.WebSocketLightMessage
import com.softwareplace.json.logger.log.JsonLog
import com.softwareplace.json.logger.log.kLogger
import org.slf4j.event.Level
import org.springframework.web.socket.CloseStatus
import org.springframework.web.socket.TextMessage
import org.springframework.web.socket.WebSocketSession


class ListenerChannel(
    private val jsonParser: JsonParser,
    private val webSocketLightsSessionLoader: WebSocketLightsSessionLoader
) : AppWebSocketHandler() {

    private val sessions: MutableMap<String, WebSocketSession> = HashMap();

    override fun path(): String = "v1/listener"

    fun onLightStateChanged(lightMessage: WebSocketLightMessage) {
        val message = messageBuild(lightMessage)
        sessions.values.forEach {
            it.sendMessage(TextMessage(message))
        }
    }

    fun onLightConnectionLost(lightMessage: WebSocketLightMessage) {
        lightMessage.isAvailable = false
        val message = messageBuild(lightMessage)
        sessions.values.forEach {
            it.sendMessage(TextMessage(message))
        }
    }

    private fun messageBuild(lightMessage: WebSocketLightMessage): String {
        val data = mapOf<String, Any?>(
            "status" to lightMessage.status,
            "lightId" to lightMessage.lightId,
            "lightName" to lightMessage.lightName,
            "isAvailable" to lightMessage.isAvailable
        )

        return jsonParser.toJson(data)
    }

    override fun afterConnectionClosed(session: WebSocketSession, status: CloseStatus) {
        sessions.remove(session.id)
        JsonLog(kLogger)
            .level(Level.INFO)
            .add("sessionId", session.id)
            .message("Lost listener connection")
            .run()
    }

    override fun afterConnectionEstablished(session: WebSocketSession) {
        sessions[session.id] = session
        JsonLog(kLogger)
            .level(Level.INFO)
            .add("sessionId", session.id)
            .message("A new listener successful connect")
            .run()
        webSocketLightsSessionLoader.getSessions()
            .forEach { session.sendMessage(TextMessage(messageBuild(it.first))) }

    }
}
