#!/usr/bin/env sh
docker container rm -f websocket-api
docker run --name websocket-api -d -p 8080:80 websocket-api:latest
