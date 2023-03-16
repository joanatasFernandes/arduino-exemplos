import 'package:flutter/material.dart';
import 'package:screen_view/screen_view.dart';
import 'package:websocket_app/app/components/home/controller/home_controller.dart';

class HostEditPage extends StatelessWidget {
  final HomeController controller;

  const HostEditPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Parent(
        style: defaultParentFormFieldStyle(MediaQuery.of(context).size),
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              TextEditDecorated(
                controller: controller.hostTextController,
                keyboardType: TextInputType.text,
                labelColor: context.primaryColor,
                borderColor: context.primaryColor,
                label: 'Host',
                textInputAction: TextInputAction.next,
              ),
              TextEditDecorated(
                controller: controller.portController,
                label: 'Porta',
                keyboardType: TextInputType.number,
              ),
              DefaultRiseButton(
                enable: true,
                onTap: controller.setCustomHost,
                child: const RiseButtonChildWidget(
                  text: 'Confirmar',
                  iconData: Icons.done_all,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
