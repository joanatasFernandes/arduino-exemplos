#!/bin/bash

cd "submodules/$1"
if [ $? -eq 0 ]; then
  make run
else
  echo "Failed to update submodules/$1"
  exit 1
fi
