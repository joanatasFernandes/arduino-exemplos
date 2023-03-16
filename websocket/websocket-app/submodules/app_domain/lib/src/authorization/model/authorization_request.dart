import 'package:dart_net_work/dart_net_work.dart';

part 'authorization_request.g.dart';

@JsonSerializable()
class AuthorizationRequest {
  String username;
  String password;

  AuthorizationRequest({
    required this.username,
    required this.password,
  });

  factory AuthorizationRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationRequestToJson(this);
}
