import 'package:get_it/get_it.dart';
import 'package:i18n_app/i18n_app.dart';
import 'package:injectable/injectable.dart';

import 'get_config.config.dart';

@Singleton(as: I18n)
class AppI18n extends I18n {}

@InjectableInit(initializerName: r'$initI18nGetIt')
void configureI18nModule(GetIt getIt) => $initI18nGetIt(getIt);
