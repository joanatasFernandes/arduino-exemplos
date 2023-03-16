package br.com.arduino.springsecurity.service

import br.com.arduino.springsecurity.model.InMemoryUser
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Component

@Component
class UserDetailsServiceImpl : UserDetailsService {

    val memoryUser = listOf(InMemoryUser())

    @Throws(UsernameNotFoundException::class)
    override fun loadUserByUsername(username: String): UserDetails? {
        return memoryUser.firstOrNull { it.authToken() == username }
    }
}
