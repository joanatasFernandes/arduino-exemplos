#!/usr/bin/env sh

cd ~/.websocker_deploy/deploy

# docker-compose build websocket-api
# docker-compose stop websocket-api
# docker-compose up -d --no-deps websocket-api

docker build . -t websocket-api
docker container rm -f websocket-api
docker run -p 80:8080 -d --name websocket-api websocket-api 
