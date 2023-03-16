import 'dart:io';

import 'package:dart_net_work/dart_net_work.dart';
import 'package:screen_view/screen_view.dart';

part 'application_response.g.dart';

const invalidPassword = 'invalidPassword';

@JsonSerializable()
class ApplicationResponseImpl extends ApplicationResponse {
  ApplicationResponseImpl({
    bool success = false,
    bool unexpectedError = false,
    bool isInternetConnected = false,
    int? code,
    required String message,
    required int timestamp,
    Map<String, Object>? info,
  }) : super(
          success: success,
          unexpectedError: unexpectedError,
          isInternetConnected: isInternetConnected,
          code: code,
          message: message,
          info: info,
          timestamp: timestamp,
        );

  factory ApplicationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$ApplicationResponseImplFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationResponseImplToJson(this);

  bool get hasInvalidPasswordError =>
      info?.containsKey(invalidPassword) ?? false;

  bool get isUnauthorized => code == HttpStatus.unauthorized;

  @override
  AlertResource errorResource(I18n i18n) {
    String message = i18n.could_not_complete_the_request;
    String svgIcon = "undraw_feeling_blue_4b7q";
    if (code == HttpStatus.unauthorized) {
      svgIcon = "undraw_unlock_24mb";
    } else if (hasInvalidPasswordError) {
      message = i18n.weakPasswordMessage;
      svgIcon = "undraw_safe_bnk7";
    } else if (!isInternetConnected) {
      message = i18n.verify_the_internet_connection;
      svgIcon = "undraw_server_down_s4lk";
    }
    return AlertResource(
      message: message,
      svgIcon: svgIcon,
    );
  }
}
