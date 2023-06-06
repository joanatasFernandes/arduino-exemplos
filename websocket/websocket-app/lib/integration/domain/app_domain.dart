import 'package:dart_net_work/dart_net_work.dart';
import 'package:screen_view/screen_view.dart';

import '../../dependecies/get_config.dart';

@Injectable(as: ApiDomain, env: [Env.dev])
class AppDomainDev extends ApiDomain {
  @override
  String baseApiUrl() => host ?? 'http://dev.local.net/arduino-websocket/api/';
}
