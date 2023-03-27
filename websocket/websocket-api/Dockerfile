FROM openjdk:11.0.2-jdk

MAINTAINER <eliasmflilico@gmail.com>

ADD ./build.sh build.sh

RUN mkdir -p /usr/app

ENTRYPOINT ["sh", "build.sh"]

