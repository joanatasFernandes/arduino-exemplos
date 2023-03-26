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

docker-deploy:
	docker rm -f websocket-api
	docker run -d --name websocket-api deploy_websocket-api:latest
	docker logs -f websocket-api
