import 'package:dart_net_work/dart_net_work.dart';

part 'light_message.g.dart';

@JsonSerializable()
class LightMessage {
  String status;
  String lightId;
  String lightName;
  bool isAvailable;

  LightMessage({
    required this.status,
    required this.lightId,
    required this.lightName,
    required this.isAvailable,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LightMessage && other.lightId == lightId;
  }

  @override
  int get hashCode => lightId.hashCode;

  factory LightMessage.fromJson(Map<String, dynamic> json) =>
      _$LightMessageFromJson(json);

  Map<String, dynamic> toJson() => _$LightMessageToJson(this);
}
