import 'package:dart_net_work/dart_net_work.dart';
import 'package:screen_view/screen_view.dart';

@Injectable(as: ApiDomain)
class AppDomain extends ApiDomain {
  @override
  String get baseApiUrl =>
      "${host ?? 'http://192.168.138.170'}:${port ?? 8080}/api/";
}
