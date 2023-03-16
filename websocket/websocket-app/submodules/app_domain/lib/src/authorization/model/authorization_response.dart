import 'package:dart_net_work/dart_net_work.dart';

part 'authorization_response.g.dart';

@JsonSerializable()
class AuthorizationResponse {
  int code;
  bool success;
  String message;
  String jwt;
  int timestamp;

  AuthorizationResponse({
    required this.code,
    required this.success,
    required this.message,
    required this.jwt,
    required this.timestamp,
  });

  factory AuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationResponseToJson(this);
}
