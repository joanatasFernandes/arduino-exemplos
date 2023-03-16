import 'package:app_websocket/app_websocket.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: MessageListener<LightMessage>)
class LightMessageListenerImpl implements MessageListener<LightMessage> {
  final messages = BehaviorSubject<List<LightMessage>>.seeded([]);

  @override
  void onMessage(LightMessage message) {
    final valuesSet = messages.value.toSet();
    valuesSet.remove(message);
    if (message.isAvailable) {
      valuesSet.add(message);
    }
    messages.add(valuesSet.toList());
  }

  @override
  BehaviorSubject<List<LightMessage>> getMessageSubject() {
    return messages;
  }
}
