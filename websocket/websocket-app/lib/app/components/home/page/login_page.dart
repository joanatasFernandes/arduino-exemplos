import 'package:flutter/material.dart';
import 'package:screen_view/screen_view.dart';
import 'package:websocket_app/app/components/home/controller/home_controller.dart';

class LoginPage extends StatelessWidget {
  final HomeController controller;

  const LoginPage({
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
                controller: controller.emailTextController,
                keyboardType: TextInputType.emailAddress,
                labelColor: context.primaryColor,
                iconData: Icons.email,
                borderColor: context.primaryColor,
                label: controller.i18n.email,
                onChange: (_) => controller.onStateChange(),
                textInputAction: TextInputAction.next,
              ),
              StreamingWidget<bool>(
                stream: controller.isObscuredText,
                builder: (obscuredText) {
                  return TextEditDecorated(
                    controller: controller.passwordTextController,
                    label: controller.i18n.password,
                    iconData: Icons.lock_open,
                    obscureText: obscuredText,
                    suffix: ObscureTextSuffixWidget(
                      onTap: controller.onObscuredTextChange,
                      visibility: obscuredText,
                    ),
                    onChange: (_) => controller.onStateChange(),
                    keyboardType: TextInputType.visiblePassword,
                  );
                },
              ),
              StreamingWidget<bool>(
                stream: controller.isInputValid,
                builder: (enable) {
                  return DefaultRiseButton(
                    enable: enable,
                    onTap: controller.login,
                    child: RiseButtonChildWidget(
                      text: controller.i18n.doLogin,
                      iconData: Icons.done_all,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
