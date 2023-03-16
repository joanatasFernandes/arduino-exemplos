import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'get_config.config.dart';

@InjectableInit(initializerName: r'$initAppDartNetWorkGetIt')
void configureDartNetWorkModule(GetIt getIt) => $initAppDartNetWorkGetIt(getIt);
