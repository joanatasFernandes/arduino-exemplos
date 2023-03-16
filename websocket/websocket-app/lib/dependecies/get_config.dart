import 'package:app_database/app_database.dart';
import 'package:app_domain/app_domain.dart';
import 'package:app_websocket/app_websocket.dart';
import 'package:dart_net_work/dart_net_work.dart';
import 'package:get_it/get_it.dart';
import 'package:i18n_app/i18n_app.dart';
import 'package:injectable/injectable.dart';

import 'get_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initRootProjectIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies(String env) {
  configureI18nModule(getIt);
  configureAppDatabaseModule(getIt);
  configureDartNetWorkModule(getIt);

  $initRootProjectIt(getIt, environment: env);

  configureAppWebsocketModule(getIt);
  configureAppDomainModule(getIt);
}

abstract class Env {
  static const dev = 'dev';
  static const test = 'test';
  static const prod = 'prod';
  static const all = [dev, test, prod];
}
