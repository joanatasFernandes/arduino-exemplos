// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_database/app_database.dart' as _i6;
import 'package:app_domain/app_domain.dart' as _i13;
import 'package:app_websocket/app_websocket.dart' as _i10;
import 'package:dart_net_work/dart_net_work.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:i18n_app/i18n_app.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

import '../app/components/home/controller/home_controller.dart' as _i12;
import '../app/components/home/navigator/home_navigator.dart' as _i9;
import '../app/listener/light_message_listener_impl.dart' as _i11;
import '../integration/domain/app_domain.dart' as _i4;
import '../integration/domain/client_provider.dart' as _i5;
import '../integration/domain/handler/client_request_handler_impl.dart' as _i7;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initRootProjectIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ApiDomain>(
    () => _i4.AppDomain(),
    registerFor: {_prod},
  );
  gh.factory<_i3.ApiDomain>(
    () => _i4.AppDomainDev(),
    registerFor: {_dev},
  );
  gh.singleton<_i3.ClientProvider>(_i5.ClientProviderImpl(
    get<_i3.ApiDomain>(),
    get<_i6.AuthorizationRepository>(),
  ));
  gh.singleton<_i3.ClientRequestHandler>(
      _i7.ClientRequestHandlerImpl(get<_i8.I18n>()));
  gh.factory<_i9.HomeNavigator>(() => _i9.HomeNavigator());
  gh.singleton<_i10.MessageListener<_i10.LightMessage>>(
      _i11.LightMessageListenerImpl());
  gh.factory<_i12.HomeController>(() => _i12.HomeController(
        get<_i3.ApiDomain>(),
        get<_i10.ConnectionService>(),
        get<_i10.MessageListener<_i10.LightMessage>>(),
        get<_i13.LoginClient>(),
        get<_i6.AuthorizationRepository>(),
        get<_i13.LightClient>(),
      ));
  return get;
}
