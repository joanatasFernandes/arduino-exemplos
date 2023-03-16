package br.com.arduino.api

import br.com.arduino.springsecurity.SpringSecurityInitializer
import br.com.arduino.websocket.WebsocketInit
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.ImportAutoConfiguration
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.scheduling.annotation.EnableAsync
import org.springframework.web.servlet.config.annotation.EnableWebMvc

@EnableAsync
@EnableWebMvc
@SpringBootApplication
@ImportAutoConfiguration(
    classes = [
        SpringSecurityInitializer::class,
        WebsocketInit::class,
    ]
)
class App

fun main(args: Array<String>) {
    SpringApplication.run(App::class.java, *args)
}
