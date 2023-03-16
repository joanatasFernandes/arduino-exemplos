package br.com.arduino.websocket.config

import br.com.arduino.websocket.handler.AppWebSocketHandler
import com.softwareplace.config.ApplicationInfo
import org.springframework.context.annotation.Configuration
import org.springframework.lang.NonNull
import org.springframework.web.socket.config.annotation.EnableWebSocket
import org.springframework.web.socket.config.annotation.WebSocketConfigurer
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry

@Configuration
@EnableWebSocket
class WebSocketConfigImpl(
    private val applicationInfo: ApplicationInfo,
    private val webSocketHandlers: Set<AppWebSocketHandler>
) : WebSocketConfigurer {
    override fun registerWebSocketHandlers(@NonNull registry: WebSocketHandlerRegistry) {
        webSocketHandlers.forEach { webSocketHandler: AppWebSocketHandler -> addHandler(registry, webSocketHandler) }
    }

    private fun addHandler(registry: WebSocketHandlerRegistry, handler: AppWebSocketHandler) {
        registry.addHandler(handler, handler.path())
            .setAllowedOrigins(*applicationInfo.allowedOrigins.toTypedArray())
    }
}
