package br.com.arduino.websocket.message

data class WebSocketLightMessage(
    val lightId: String,
    val lightName: String,
    val fistMessage: Boolean = false,
    val status: LightStatus? = null,
    val content: Map<String, Any>? = null,
    var isAvailable: Boolean = true,
)
