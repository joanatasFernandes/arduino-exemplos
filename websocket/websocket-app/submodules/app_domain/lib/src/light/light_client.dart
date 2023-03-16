import 'package:app_domain/src/light/light_response.dart';
import 'package:dart_net_work/dart_net_work.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

part 'light_client.g.dart';

@RestApi()
abstract class _LightClient {
  @GET("/lights/turn/{status}")
  Future<HttpResponse<LightResponse>> __request(
    @Path("status") String status,
    @Query("lightId") List<String> lightsId,
  );
}

@singleton
class LightClient extends __LightClient {
  late final ClientRequestHandler _clientRequest;

  LightClient(ClientRequestHandler clientRequest, ClientProvider clientProvider)
      : super(clientProvider.provider) {
    _clientRequest = clientRequest;
  }

  request({
    required String status,
    required List<String> lightsId,
    required OnRequestSuccess<LightResponse> onRequestSuccess,
    required OnRequestError onRequestError,
  }) =>
      _clientRequest.request(
        () => __request(status, lightsId),
        onRequestSuccess,
        onRequestError,
      );
}
