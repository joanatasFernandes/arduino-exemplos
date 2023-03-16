import com.gradle.kts.build.configuration.addSpringframeworkBoot
import com.gradle.kts.build.source.springBootSecurityUtils
import com.gradle.kts.build.source.springConfigurationProcessor


group = "br.com.arduino.websocket"
version = "1.0.0-SNAPSHOT"

dependencies {
    addSpringframeworkBoot("spring-boot-starter-websocket")
    springBootSecurityUtils()
    springConfigurationProcessor()
}
