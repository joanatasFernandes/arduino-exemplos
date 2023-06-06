import 'package:flutter/material.dart';
import 'package:screen_view/screen_view.dart';
import 'package:websocket_app/app/components/home/controller/home_controller.dart';
import 'package:websocket_app/app/widget/logout_buttom.dart';

class HomeScreen extends BaseScreen<HomeController> {
  static const String homeScreenRouter = "/";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeController> {
  @override
  AppBar? appBuild() => AppBar(
        title: TitleAppBar(
          controller: controller,
          hintText: controller.i18n.search,
          defaultTitle: Text(controller.i18n.app_name),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          LogoutButton(
            controller: controller,
          ),
        ],
      );
}

