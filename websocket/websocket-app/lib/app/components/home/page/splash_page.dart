import 'package:flutter/material.dart';
import 'package:websocket_app/app/components/home/controller/home_controller.dart';

class SplashPage extends StatelessWidget {
  final HomeController controller;

  const SplashPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.background),
        ),
      ),
    );
  }
}
