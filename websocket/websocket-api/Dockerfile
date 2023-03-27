FROM openjdk:11.0.2-jdk
MAINTAINER <eliasmflilico@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Sao_Paulo
ENV SERVER_PORT=80

RUN mkdir -p /usr/app

WORKDIR /usr/app

ADD . /usr/app

COPY ./src /usr/app
COPY ./build /usr/app
COPY ./gradle /usr/app
COPY ./gradlew /usr/app
COPY ./settings.gradle.kts /usr/app
COPY ./build.sh /usr/app
COPY ./build.gradle.kts /usr/app

CMD sh build.sh

# Expose the port
EXPOSE 80
