package br.com.arduino.api.controller

import br.com.arduino.api.model.UpdatedLightsStatus200Response
import br.com.arduino.websocket.message.LightStatus
import br.com.arduino.websocket.notify.LightChangeNotify
import org.springframework.http.ResponseEntity
import org.springframework.scheduling.annotation.Async
import org.springframework.web.bind.annotation.RestController
import java.util.*

@RestController
class LightsControllerImpl(
    private val lightChangeNotify: LightChangeNotify,
) : LightsApi {

    override fun updatedLightsStatus(authorization: String, status: String, lightId: List<String>): ResponseEntity<UpdatedLightsStatus200Response> {
        changeStatus(lightId, status)
        return ResponseEntity.ok(UpdatedLightsStatus200Response("Request successful"))
    }

    @Async
    fun changeStatus(lightId: List<String>, status: String) {
        lightChangeNotify.changeLightsStatus(lightId, LightStatus.valueOf(status.uppercase(Locale.getDefault())))
    }
}
