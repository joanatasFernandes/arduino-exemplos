import 'package:dart_net_work/dart_net_work.dart';
import 'package:screen_view/screen_view.dart';

@Injectable(as: ApiDomain)
class AppDomain extends ApiDomain {
  @override
  String  baseApiUrl() =>
      host ?? 'https://app-workspace.com/arduino-websocket/api/';
}
