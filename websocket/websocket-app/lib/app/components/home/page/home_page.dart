import 'package:app_websocket/app_websocket.dart';
import 'package:flutter/material.dart';
import 'package:screen_view/screen_view.dart';
import 'package:websocket_app/app/components/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamingWidget<List<LightMessage>>(
      stream: controller.messageListener.getMessageSubject(),
      builder: (messages) {
        return ListViewBuilder<LightMessage>(
          padding: const EdgeInsets.all(0.0),
          values: messages,
          itemBuilder: (message, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      message.lightName,
                      style: const TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.lightbulb_outline,
                        color:
                            message.status == "ON" ? Colors.amber : Colors.grey,
                        size: 45,
                      ),
                      onTap: () => controller.changeLightStatus(message),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
