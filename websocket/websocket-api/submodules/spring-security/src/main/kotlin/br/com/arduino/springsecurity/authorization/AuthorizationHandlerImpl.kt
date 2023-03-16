package br.com.arduino.springsecurity.authorization

import br.com.arduino.springsecurity.model.InMemoryUser
import com.softwareplace.authorization.AuthorizationHandler
import com.softwareplace.model.UserData
import javax.servlet.FilterChain
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse


class AuthorizationHandlerImpl : AuthorizationHandler {
    override fun authorizationSuccessfully(request: HttpServletRequest, userData: UserData) {
        // ignoring
    }

    override fun onAuthorizationFailed(request: HttpServletRequest, response: HttpServletResponse) {
        // ignoring
    }

    override fun onAuthorizationFailed(
        request: HttpServletRequest,
        response: HttpServletResponse,
        chain: FilterChain,
        exception: Exception
    ) {
        // ignoring
    }

    override fun userConfig(): List<Pair<String, List<String>>> {
        return listOf(
            "/**" to listOf(InMemoryUser.ROLE_ADMIN),
        )
    }
}
