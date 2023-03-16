import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'get_config.config.dart';

@InjectableInit(initializerName: r'$initAppDomainGetIt')
void configureAppDomainModule(GetIt getIt) => $initAppDomainGetIt(getIt);
