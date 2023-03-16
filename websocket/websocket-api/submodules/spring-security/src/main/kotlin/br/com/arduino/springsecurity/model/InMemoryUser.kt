package br.com.arduino.springsecurity.model

import com.softwareplace.model.UserData
import com.softwareplace.model.authoritiesRoles

open class InMemoryUser : UserData {
    companion object {
        const val ROLE_ADMIN = "ARDUINO"
    }

    override fun authToken() = "\$2a\$05\$CgMkFcRploOxJoDdclbcUuB57QIMIAfrumOL9hcAap.WTsYQZzZp."
    override fun getAuthorities() = this.authoritiesRoles

    override fun userRoles(): Array<String> = arrayOf(ROLE_ADMIN)

    override fun getPassword(): String = "\$2a\$05\$I0PRQNudEn.xTZq9Xb5Wa.KThQNagnoI7fty72qjpfmFo2fqnzpQS"

    override fun getUsername(): String = "arduino@websocket.com"
    override fun isEnabled() = true
}
