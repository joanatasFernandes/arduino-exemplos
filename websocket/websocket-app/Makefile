targetBuild ?= dev

clean:
	flutter clean

libs-update:
	flutter pub upgrade --major-versions

build-run:
	flutter clean
	flutter pub get
	flutter packages run build_runner build --delete-conflicting-outputs

update:
	sh runner.sh i18n_app
	sh runner.sh app_database
	sh runner.sh app_domain
	sh runner.sh app_websocket
	sh runner.sh dart_net_work
	sh runner.sh screen_view
	make build-run

apk:
	make build-run
	flutter build apk --dart-define=targetBuild=$(targetBuild) --split-per-abi --target-platform android-arm,android-arm64,android-x64

web-build:
	make update
	flutter build web --dart-define=targetBuild=$(targetBuild)  --base-href '/'

dev-deploy:
	sh dev-deploy.sh

deploy:
	sh deploy.sh

docker-dev-apk:
	sh build-dev-apk.sh

run-watch:
	flutter pub get
	flutter packages run build_runner build watch --delete-conflicting-outputs --use-polling-watcher
