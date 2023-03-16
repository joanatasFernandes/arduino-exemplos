package br.com.arduino.websocket.loader

import br.com.arduino.websocket.message.WebSocketLightMessage
import org.springframework.web.socket.WebSocketSession

class WebSocketLightsSessionLoader {

    private val sessions: MutableMap<String, Pair<WebSocketLightMessage, WebSocketSession>>

    init {
        sessions = HashMap()
    }

    fun store(message: WebSocketLightMessage, session: WebSocketSession) {
        sessions[session.id] = message to session
    }

    fun getSessions(): List<Pair<WebSocketLightMessage, WebSocketSession>> {
        return sessions.values.toMutableList()
    }

    fun findBy(session: WebSocketSession): Pair<WebSocketLightMessage, WebSocketSession>? {
        return sessions[session.id]
    }

    fun remove(session: WebSocketSession) {
        sessions.remove(session.id)
    }
}
