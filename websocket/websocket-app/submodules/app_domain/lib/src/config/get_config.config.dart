// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dart_net_work/dart_net_work.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../authorization/client/login_client.dart' as _i5;
import '../light/light_client.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initAppDomainGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.LightClient>(_i3.LightClient(
    get<_i4.ClientRequestHandler>(),
    get<_i4.ClientProvider>(),
  ));
  gh.singleton<_i5.LoginClient>(_i5.LoginClient(
    get<_i4.ClientRequestHandler>(),
    get<_i4.ClientProvider>(),
  ));
  return get;
}
