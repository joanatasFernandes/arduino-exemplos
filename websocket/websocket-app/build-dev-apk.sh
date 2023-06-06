#!/bin/bash

docker-compose -f ./docker-compose-build-apk-dev.yaml down
docker-compose -f ./docker-compose-build-apk-dev.yaml up --build
docker-compose -f ./docker-compose-build-apk.yaml logs -f
