import 'package:flutter/material.dart';
import 'package:screen_view/screen_view.dart';
import 'package:websocket_app/app/components/home/page/home_page.dart';
import 'package:websocket_app/app/components/home/page/host_edit_page.dart';
import 'package:websocket_app/app/components/home/page/login_page.dart';
import 'package:websocket_app/app/components/home/page/splash_page.dart';

@injectable
class HomeNavigator extends BaseScreenNavigator {
  @override
  Widget nextNavigate(
      RouteSettings settings, BaseController<BaseScreenNavigator> controller) {
    switch (settings.name) {
      case initPath:
        currentPage = initialPage;
        return HomePage(controller: controller.cast());
      case splashPath:
        currentPage = splashPath;
        return SplashPage(controller: controller.cast());
      case "/host-edit":
        currentPage = "/host-edit";
        return HostEditPage(controller: controller.cast());
      case successfulPath:
        currentPage = successfulPath;
        return alertBuild(
          onTap: () {
            home();
            controller.onLoadHome();
          },
          message: i18n.login_successful,
          iconButton: FontAwesomeIcons.check,
          alertIcon:
              AssetsUtil.loadScreenViewSvgAlert("undraw_Powerful_re_frhr"),
        );
      default:
        currentPage = loginPath;
        return LoginPage(controller: controller.cast());
    }
  }
}
