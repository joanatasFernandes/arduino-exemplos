import 'package:app_domain/app_domain.dart';
import 'package:dart_net_work/dart_net_work.dart';
import 'package:i18n_app/i18n_app.dart';
import 'package:injectable/injectable.dart';

import '../model/application_response.dart';

@Singleton(as: ClientRequestHandler)
class ClientRequestHandlerImpl extends ClientRequestHandler {
  final I18n i18n;

  ClientRequestHandlerImpl(this.i18n);

  @override
  void unexpectedError(OnRequestError onRequestError) async {
    var isInternetConnected = await NetworkInfo.hasInternetConnection();
    var message = isInternetConnected
        ? i18n.could_not_complete_the_request
        : i18n.verify_the_internet_connection;

    var applicationResponse = ApplicationResponseImpl(
      message: message,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      isInternetConnected: isInternetConnected,
      unexpectedError: true,
    );

    onRequestError(applicationResponse);
  }

  @override
  void responseHandler(
    Response<dynamic> response,
    OnRequestError onRequestError,
  ) async {
    try {
      var isInternetConnected = await NetworkInfo.hasInternetConnection();
      var applicationResponse = ApplicationResponseImpl.fromJson(response.data);
      applicationResponse.isInternetConnected = isInternetConnected;
      onRequestError(applicationResponse);
    } catch (ignore) {
      unexpectedError(onRequestError);
    }
  }
}
