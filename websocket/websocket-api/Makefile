update:
	git submodule update --recursive --init
	git submodule update --recursive --remote

rebuild:
	./gradlew clean build

run:
	./gradlew clean bootRun

test:
	./gradlew clean test

clean:
	./gradlew clean

deploy:
	./gradlew clean bootJar
	docker-compose build websocket-api
	docker-compose up -d --no-deps websocket-api
