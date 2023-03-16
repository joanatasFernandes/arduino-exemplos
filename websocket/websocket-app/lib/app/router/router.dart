import 'package:screen_view/screen_view.dart';
import 'package:websocket_app/app/components/home/screen/home_screen.dart';

class AppRouter {
  AppRouter.__();

  static void init() {
    ScreenViewRouter.addPage(HomeScreen.homeScreenRouter, const HomeScreen());
  }
}
