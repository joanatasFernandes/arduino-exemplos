rebuild:
	git submodule update --recursive --init
	git submodule update --recursive --remote
	./gradlew clean build

run:
	git submodule update --recursive --init
	git submodule update --recursive --remote
	./gradlew clean bootRun

test:
	git submodule update --recursive --init
	git submodule update --recursive --remote
	./gradlew clean test

clean:
	./gradlew clean

docker-deploy:
	make rebuild
	docker-compose up --build -d

docker-logs:
	docker-compose logs -f
