package br.com.arduino.websocket.json

import com.fasterxml.jackson.core.JsonProcessingException
import com.fasterxml.jackson.core.type.TypeReference
import com.fasterxml.jackson.databind.ObjectMapper
import org.springframework.stereotype.Component
import java.io.IOException

@Component
class JsonParser(
    private val mapper: ObjectMapper
) {

    @Throws(JsonProcessingException::class)
    fun <T> toJson(data: T): String {
        return mapper.writeValueAsString(data)
    }

    @Throws(JsonProcessingException::class)
    fun <T> toJson(data: T, mapper: ObjectMapper): String {
        return mapper.writeValueAsString(data)
    }

    @Throws(JsonProcessingException::class)
    fun <T> fromJson(jsonValue: String, typeRef: TypeReference<T>): T {
        return mapper.readValue(jsonValue, typeRef)
    }

    @Throws(JsonProcessingException::class)
    fun <T> fromJson(jsonValue: String, mapper: ObjectMapper, typeRef: TypeReference<T>): T {
        return mapper.readValue(jsonValue, typeRef)
    }

    @Throws(IOException::class)
    fun <T> fromJson(asBytes: ByteArray, messageTypeRef: TypeReference<T>): T {
        return mapper.readValue(asBytes, messageTypeRef)
    }
}
