FROM openjdk:11.0.2-jdk

MAINTAINER <eliasmflilico@gmail.com>

COPY ./build/libs/websocket-api-1.0.0.jar /runner.jar

ENV SERVER_PORT 8080

ENTRYPOINT ["java", "-jar", "runner.jar"]

EXPOSE $SERVER_PORT


