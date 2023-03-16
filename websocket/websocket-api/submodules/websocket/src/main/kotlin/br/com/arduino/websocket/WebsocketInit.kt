package br.com.arduino.websocket

import br.com.arduino.websocket.config.WebSocketConfigImpl
import br.com.arduino.websocket.json.JsonParser
import br.com.arduino.websocket.loader.WebSocketLightsSessionLoader
import br.com.arduino.websocket.notify.LightChangeNotify
import br.com.arduino.websocket.notify.ListenerChannel
import com.fasterxml.jackson.databind.ObjectMapper
import org.springframework.boot.autoconfigure.ImportAutoConfiguration
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
@ImportAutoConfiguration(classes = [WebSocketConfigImpl::class])
class WebsocketInit {

    @Bean
    fun jsonParser(mapper: ObjectMapper) = JsonParser(mapper)

    @Bean
    fun webSocketLightsSessionLoader(): WebSocketLightsSessionLoader {
        return WebSocketLightsSessionLoader()
    }

    @Bean
    fun lightChangeNotify(
        jsonParser: JsonParser,
        webSocketLightsSessionLoader: WebSocketLightsSessionLoader,
        listenerChannel: ListenerChannel
    ) = LightChangeNotify(jsonParser, webSocketLightsSessionLoader, listenerChannel)

    @Bean
    fun listenerChannel(
        jsonParser: JsonParser,
        webSocketLightsSessionLoader: WebSocketLightsSessionLoader,
    ) = ListenerChannel(jsonParser, webSocketLightsSessionLoader)
}
