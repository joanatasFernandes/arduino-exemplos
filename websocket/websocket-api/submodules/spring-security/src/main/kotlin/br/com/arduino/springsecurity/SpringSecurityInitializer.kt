package br.com.arduino.springsecurity

import br.com.arduino.springsecurity.authorization.AuthorizationHandlerImpl
import br.com.arduino.springsecurity.service.AuthorizationUserServiceImpl
import br.com.arduino.springsecurity.service.UserDetailsServiceImpl
import com.softwareplace.SpringSecurityInit
import org.springframework.boot.autoconfigure.ImportAutoConfiguration
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration

@Configuration
@ImportAutoConfiguration(classes = [SpringSecurityInit::class])
class SpringSecurityInitializer {

    @Bean
    fun userDetailsService() = UserDetailsServiceImpl()

    @Bean
    fun authorizationService(userDetailsService: UserDetailsServiceImpl) = AuthorizationUserServiceImpl(userDetailsService)

    @Bean
    fun authorizationHandler() = AuthorizationHandlerImpl()
}
