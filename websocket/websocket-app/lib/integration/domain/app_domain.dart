import 'package:dart_net_work/dart_net_work.dart';
import 'package:screen_view/screen_view.dart';

import '../../dependecies/get_config.dart';

@Injectable(as: ApiDomain, env: [Environment.prod])
class AppDomain extends ApiDomain {
  @override
  String baseApiUrl() =>
      host ?? 'https://app-workspace.com/arduino-websocket/api/';
}

@Injectable(as: ApiDomain, env: [Env.dev])
class AppDomainDev extends ApiDomain {
  @override
  String baseApiUrl() => host ?? 'http://dev.local.net/arduino-websocket/api/';
}
