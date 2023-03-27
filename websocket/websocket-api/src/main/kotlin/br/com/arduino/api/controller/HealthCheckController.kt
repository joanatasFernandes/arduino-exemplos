package br.com.arduino.api.controller

import br.com.arduino.api.model.HealthCheck200Response
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.RestController

@RestController
class HealthCheckController : HealthApi {
    override fun healthCheck(): ResponseEntity<HealthCheck200Response> {
        return ResponseEntity.ok(HealthCheck200Response("Application is running"))
    }
}
