import 'package:app_database/app_database.dart';
import 'package:dart_net_work/dart_net_work.dart';
import 'package:screen_view/screen_view.dart';

@Singleton(as: ClientProvider)
class ClientProviderImpl extends ClientProvider {
  final AuthorizationRepository _repository;

  ClientProviderImpl(ApiDomain apiDomain, this._repository) : super(apiDomain);

  @override
  Future<String?> authorizationHeader() async {
    return _repository.authorization();
  }
}
