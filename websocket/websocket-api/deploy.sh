#!/usr/bin/env sh
docker container rm -f websocket-api
docker run --name websocket-api -d websocket-api:latest
