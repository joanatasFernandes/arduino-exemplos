#!/usr/bin/env sh

rm -rf ~/.websocker_deploy/
mkdir ~/.websocker_deploy/
cp -r . ~/.websocker_deploy/
cd ~/.websocker_deploy/

rm -rf .git
rm -rf spring-boot-included-builds
git init
git submodule add --force https://github.com/eliasmeireles/spring-boot-included-builds.git  spring-boot-included-builds
git submodule update --recursive --init
git submodule update --recursive --remote

./gradlew bootJar

cp ./build/libs/websocket-api-1.0.0.jar ./deploy/runner.jar

cd ./deploy

docker-compose build websocket-api
