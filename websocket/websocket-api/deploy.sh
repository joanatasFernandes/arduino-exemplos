#!/usr/bin/env sh

cd ~/.websocker_deploy/deploy

docker-compose build websocket-api
docker-compose stop websocket-api
docker-compose up -d --no-deps websocket-api

rm -rf ~/.websocker_deploy/