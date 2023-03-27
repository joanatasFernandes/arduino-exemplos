FROM openjdk:11.0.2-jdk
MAINTAINER <eliasmflilico@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Sao_Paulo
ENV SERVER_PORT=80

RUN mkdir -p /usr/app

WORKDIR /usr/app

ADD . /usr/app

COPY ./runner.jar /usr/app/runner.jar


CMD java -jar /usr/app/runner.jar

# Expose the port
EXPOSE 80
