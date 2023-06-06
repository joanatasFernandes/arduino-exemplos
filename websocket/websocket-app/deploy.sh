#!/bin/bash

docker-compose -f ./docker-compose.yaml down
docker-compose -f ./docker-compose.yaml up --build -d
docker-compose -f ./docker-compose.yaml logs -f
