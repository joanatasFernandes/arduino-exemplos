rootProject.name = "websocket-api"

include(":submodules:websocket")
include(":submodules:spring-security")

pluginManagement {
    repositories {
        mavenCentral()
        gradlePluginPortal()
        maven("https://jitpack.io")
    }
}

buildscript {
    System.setProperty("springBootVersion", "2.7.2")
    System.setProperty("kotlinVersion", "1.6.21")
    System.setProperty("springDependencyManagementVersion", "1.0.11.RELEASE")
}

includeBuild("spring-boot-included-builds/build-configuration")
includeBuild("spring-boot-included-builds/build-source")
includeBuild("spring-boot-included-builds/spring-openapi")
