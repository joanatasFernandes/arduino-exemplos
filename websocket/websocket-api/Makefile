rebuild:
	git submodule update --recursive --init
	git submodule update --recursive --remote
	./gradlew clean build

run:
	git submodule update --recursive --init
	git submodule update --recursive --remote
	./gradlew clean bootRun

test:
	./gradlew clean test

clean:
	./gradlew clean
	
image-build:
	docker build . -t websocket-api:latest

docker-run:
	sh ./deploy.sh
