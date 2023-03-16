import com.gradle.kts.build.configuration.addSpringframeworkBoot
import com.gradle.kts.build.source.*

plugins {
    kotlin("jvm") version System.getProperty("kotlinVersion")
    id("build-kotlin-spring-openapi-plugin")
    id("build-source-plugin")
}

group = "br.com.arduino.api"
version = "1.0.0"

dependencies {
    addSpringframeworkBoot("spring-boot-starter-websocket")
    implementation(project(":submodules:spring-security"))
    implementation(project(":submodules:websocket"))
    springConfigurationProcessor()
    springBootSecurityUtils()
    springSecurity()
    springJettyApi()
    jsonLogger()
    springDoc()
    test()
}

