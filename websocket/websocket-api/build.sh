#!/usr/bin/env sh

rm -rf .git
rm -rf spring-boot-included-builds
git init
git submodule add --force https://github.com/eliasmeireles/spring-boot-included-builds.git  spring-boot-included-builds
git submodule update --recursive --init
git submodule update --recursive --remote

./gradlew bootRun
