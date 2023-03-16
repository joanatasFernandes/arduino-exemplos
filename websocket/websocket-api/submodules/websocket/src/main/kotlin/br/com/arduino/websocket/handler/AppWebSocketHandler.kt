package br.com.arduino.websocket.handler

import br.com.arduino.websocket.message.WebSocketLightMessage
import com.fasterxml.jackson.core.type.TypeReference
import org.springframework.web.socket.handler.TextWebSocketHandler

abstract class AppWebSocketHandler : TextWebSocketHandler() {
    abstract fun path(): String?

    protected fun messageTypeRef(): TypeReference<WebSocketLightMessage> {
        return object : TypeReference<WebSocketLightMessage>() {}
    }
}
