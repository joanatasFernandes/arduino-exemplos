#!/usr/bin/env sh

if wget -O ./run.jar https://github.com/eliasmeireles/arduino-exemplos/raw/main/websocket/websocket-api/runner.jar; then
      java -jar run.jar
fi


