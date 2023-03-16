FROM openjdk:11.0.2-jdk
MAINTAINER Construo Dev Team <eliasmflilico@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Sao_Paulo
ENV SERVER_PORT=8080

RUN mkdir -p /usr/app

WORKDIR /usr/app

ADD . /usr/app

COPY ./build/libs/websocket-api-1.0.0.jar /usr/app/websocket-api.jar

#RUN mvn clean install -DskipTests

CMD java -jar /usr/app/websocket-api.jar

# Expose the port
EXPOSE 8080
