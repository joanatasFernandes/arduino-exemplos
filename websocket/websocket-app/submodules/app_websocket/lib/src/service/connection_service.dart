import 'dart:async';
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
  bool _shouldReconnect = true;
  Timer? _reconnectTimer;

  ConnectionService(this.apiDomain, this.lightMessageListener);

  void connect() {
    if (_reconnectTimer != null) {
      _reconnectTimer!.cancel();
    }
    _shouldReconnect = true;

    final apiHost = apiDomain
        .baseApiUrl()
        .replaceAll("http://", "ws://")
        .replaceAll("https://", "wss://");

    channel = WebSocketChannel.connect(Uri.parse("${apiHost}v1/listener"));

    channel.stream.listen(
      (message) {
        Map<String, dynamic> messageMap = jsonDecode(message);
        lightMessageListener.onMessage(LightMessage.fromJson(messageMap));
      },
      onDone: _handleConnectionLost,
      onError: (error) {
        "WebSocket error: $error".debugLog();
        _handleConnectionLost();
      },
    );
  }

  void _handleConnectionLost() {
    if (_shouldReconnect) {
      "Connection lost. Attempting to reconnect...".debugLog();
      _reconnectTimer = Timer(const Duration(seconds: 5), connect);
    }
  }

  void close() {
    _shouldReconnect = false;
    _reconnectTimer?.cancel();
    channel.sink.close();
  }
}
