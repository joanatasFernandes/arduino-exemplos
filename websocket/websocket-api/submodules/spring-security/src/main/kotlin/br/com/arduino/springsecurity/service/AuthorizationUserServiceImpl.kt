package br.com.arduino.springsecurity.service

import com.softwareplace.encrypt.Encrypt
import com.softwareplace.model.RequestUser
import com.softwareplace.model.UserData
import com.softwareplace.service.AuthorizationUserService
import org.springframework.security.core.Authentication
import org.springframework.stereotype.Component
import javax.servlet.FilterChain
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse


@Component
class AuthorizationUserServiceImpl(
    private val userDetailsService: UserDetailsServiceImpl
) : AuthorizationUserService {
    override fun claims(httpServletRequest: HttpServletRequest, userData: UserData): Map<String, Any> {
        return HashMap()
    }

    override fun findUser(user: RequestUser): UserData? {
        return getDefaultUser(user.password)
    }

    override fun findUser(authToken: String): UserData? {
        return getDefaultUser(authToken)
    }

    override fun successfulAuthentication(
        request: HttpServletRequest,
        response: HttpServletResponse,
        chain: FilterChain,
        authResult: Authentication
    ) {
        // ignoring
    }

    private fun getDefaultUser(token: String): UserData? {
        return userDetailsService.memoryUser.firstOrNull {
            token.replace("${it.username}:", "") == it.authToken() ||
                    Encrypt(token).isValidPassword(it.password)
        }
    }
}
