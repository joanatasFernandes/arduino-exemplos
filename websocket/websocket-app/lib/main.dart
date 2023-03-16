import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:websocket_app/app/app.dart';

import 'dependecies/get_config.dart';

class EnvironmentConfig {
  static const targetBuild = String.fromEnvironment(
    'targetBuild',
    defaultValue: Env.dev,
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await Hive.initFlutter();
    configureDependencies(EnvironmentConfig.targetBuild);
    runApp(const AppWidget());
  });
}
