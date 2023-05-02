#!/bin/bash

docker-compose -f ./docker-compose-dev.yaml down
docker-compose -f ./docker-compose-dev.yaml up --build -d
docker-compose -f ./docker-compose-dev.yaml logs -f
