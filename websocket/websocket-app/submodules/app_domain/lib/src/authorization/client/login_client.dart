import 'package:app_domain/src/authorization/model/authorization_request.dart';
import 'package:app_domain/src/authorization/model/authorization_response.dart';
import 'package:dart_net_work/dart_net_work.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

part 'login_client.g.dart';

@RestApi()
abstract class _LoginClient {
  @POST("/authorization")
  Future<HttpResponse<AuthorizationResponse>> __requestAuthorization(
      @Body() AuthorizationRequest userAuthorization);
}

@singleton
class LoginClient extends __LoginClient {
  late final ClientRequestHandler _clientRequest;

  LoginClient(ClientRequestHandler clientRequest, ClientProvider clientProvider)
      : super(clientProvider.provider) {
    _clientRequest = clientRequest;
  }

  requestAuthorization({
    required AuthorizationRequest request,
    required OnRequestSuccess<AuthorizationResponse> onRequestSuccess,
    required OnRequestError onRequestError,
  }) =>
      _clientRequest.request(
            () => __requestAuthorization(request),
        onRequestSuccess,
        onRequestError,
      );
}
