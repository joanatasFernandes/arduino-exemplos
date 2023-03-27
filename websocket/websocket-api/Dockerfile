FROM gradle:jdk11
MAINTAINER <eliasmflilico@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Sao_Paulo
ENV SERVER_PORT=80

RUN mkdir -p /usr/app

WORKDIR /usr/app

ADD . /usr/app

#COPY ./src /usr/app
#COPY ./gradle /usr/app
#COPY ./gradlew /usr/app
#COPY ./settings.gradle.kts /usr/app
#COPY ./build.sh /usr/app
#COPY ./build.gradle.kts /usr/app

CMD apt-get update &&  apt-get install -y curl && sh /usr/app/build.sh

# Expose the port
EXPOSE 80
