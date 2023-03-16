import com.gradle.kts.build.source.*

group = "br.com.arduino.springsecurity"
version = "1.0.0"


dependencies {
    springConfigurationProcessor()
    springBootSecurityUtils()
    springSecurity()
    jsonLogger()
    test()
}
