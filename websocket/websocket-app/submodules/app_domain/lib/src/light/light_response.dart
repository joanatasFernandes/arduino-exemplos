import 'package:dart_net_work/dart_net_work.dart';

part 'light_response.g.dart';

@JsonSerializable()
class LightResponse {
  String message;

  LightResponse({required this.message});

  factory LightResponse.fromJson(Map<String, dynamic> json) =>
      _$LightResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LightResponseToJson(this);
}
