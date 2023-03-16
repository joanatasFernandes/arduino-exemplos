import 'dart:convert';

import 'package:app_websocket/src/model/light_message.dart';
import 'package:app_websocket/src/service/message_listener.dart';
import 'package:dart_net_work/dart_net_work.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@singleton
class ConnectionService {
  final ApiDomain apiDomain;

  final MessageListener<LightMessage> lightMessageListener;

  late WebSocketChannel channel;

  ConnectionService(this.apiDomain, this.lightMessageListener);

  void connect() {
    final apiHost =
        apiDomain.baseApiUrl.replaceAll("https", "ws").replaceAll("http", "ws");
    channel = WebSocketChannel.connect(Uri.parse("${apiHost}v1/listener"));

    channel.stream.listen(
      (message) {
        Map<String, dynamic> messageMap = jsonDecode(message);
        lightMessageListener.onMessage(LightMessage.fromJson(messageMap));
      },
    );
  }

  void close() {
    channel.sink.close();
  }
}
