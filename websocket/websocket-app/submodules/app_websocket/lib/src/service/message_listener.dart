import 'package:app_websocket/app_websocket.dart';
import 'package:rxdart/rxdart.dart';

abstract class MessageListener<T> {
  void onMessage(T message);

  BehaviorSubject<List<LightMessage>> getMessageSubject();
}
