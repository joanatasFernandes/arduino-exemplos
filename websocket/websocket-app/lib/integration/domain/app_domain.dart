import 'package:dart_net_work/dart_net_work.dart';
import 'package:screen_view/screen_view.dart';

@Injectable(as: ApiDomain)
class AppDomain extends ApiDomain {
  @override
  String get baseApiUrl =>
      "${host ?? 'http://192.168.2.19'}:${port ?? 8080}/api/";
}
