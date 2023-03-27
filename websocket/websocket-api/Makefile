rebuild:
	git submodule update --recursive --init
	git submodule update --recursive --remote
	./gradlew clean build

jar:
	git submodule update --recursive --init
	git submodule update --recursive --remote
	./gradlew clean build
	cp ./build/libs/websocket-api-1.0.0.jar ./runner.jar

run:
	git submodule update --recursive --init
	git submodule update --recursive --remote
	./gradlew clean bootRun

test:
	./gradlew clean test

clean:
	./gradlew clean
	
image-build:
	make jar
	docker build . -t websocket-api:latest

docker-run:
	sh ./deploy.sh
