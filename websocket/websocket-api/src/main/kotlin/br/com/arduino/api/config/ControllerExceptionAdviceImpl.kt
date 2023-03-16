package br.com.arduino.api.config

import com.fasterxml.jackson.databind.ObjectMapper
import com.softwareplace.config.ControllerExceptionAdvice
import org.springframework.core.Ordered
import org.springframework.core.annotation.Order
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.RestControllerAdvice
import java.util.*


@Order(Ordered.HIGHEST_PRECEDENCE)
@RestControllerAdvice
@ControllerAdvice(annotations = [RestController::class])
class ControllerExceptionAdviceImpl(
    mapper: ObjectMapper
) : ControllerExceptionAdvice(mapper)
