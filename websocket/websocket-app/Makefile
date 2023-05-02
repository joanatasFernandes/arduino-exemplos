clean:
	flutter clean

libs-update:
	flutter pub upgrade --major-versions

apk:
	flutter clean
	flutter pub get
	flutter packages run build_runner build --delete-conflicting-outputs
	flutter build apk --dart-define=targetBuild=dev --split-per-abi --target-platform android-arm,android-arm64,android-x64
	open build/app/outputs/flutter-apk/

web-app:
	flutter clean
	flutter pub get
	flutter packages run build_runner build --delete-conflicting-outputs
	flutter build web --dart-define=targetBuild=dev

docker-web:
	flutter --version
	sh runner.sh i18n_app
	sh runner.sh app_database
	sh runner.sh app_domain
	sh runner.sh app_websocket
	sh runner.sh dart_net_work
	sh runner.sh screen_view
	make web-app

text:
	flutter pub run i18n_json

run:
	flutter pub get
	flutter packages run build_runner build --delete-conflicting-outputs

run-watch:
	flutter pub get
	flutter packages run build_runner build watch --delete-conflicting-outputs --use-polling-watcher
