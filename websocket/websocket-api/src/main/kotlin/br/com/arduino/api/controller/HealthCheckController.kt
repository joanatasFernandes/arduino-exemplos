package br.com.arduino.api.controller

import br.com.arduino.api.model.HealthCheck200Response
import com.softwareplace.json.logger.log.JsonLog
import com.softwareplace.json.logger.log.kLogger
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.RestController

@RestController
class HealthCheckController : HealthApi {
    override fun healthCheck(): ResponseEntity<HealthCheck200Response> {
        JsonLog(kLogger)
            .message("Health checking.")
            .run()
        return ResponseEntity.ok(HealthCheck200Response("Application is running"))
    }
}
