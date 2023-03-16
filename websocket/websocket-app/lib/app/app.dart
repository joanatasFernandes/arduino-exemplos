import 'package:flutter/material.dart';
import 'package:i18n_app/i18n_app.dart';
import 'package:screen_view/screen_view.dart';
import 'package:websocket_app/app/router/router.dart';
import 'package:websocket_app/app/theme/app_colors.dart';
import 'package:websocket_app/app/theme/dark_theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    AppRouter.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp(context);
  }

  MaterialApp _buildMaterialApp(BuildContext context) {
    return MaterialApp(
      navigatorKey: ScreenViewRouter.globalNavigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: _localizationsDelegates(),
      supportedLocales: I18n.delegate.supportedLocales,
      localeResolutionCallback:
          I18n.delegate.resolution(fallback: const Locale("pt", "BR")),
      theme: _themeData(DarkModeTheme()),
      onGenerateRoute: ScreenViewRouter.onGenerateRoute,
    );
  }

  List<LocalizationsDelegate<dynamic>> _localizationsDelegates() {
    return const [
      I18n.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  ThemeData _themeData(AppColorsTheme appTheme) {
    return ThemeData(
      popupMenuTheme: PopupMenuThemeData(
        textStyle: TextStyle(
          color: appTheme.primaryColor,
        ),
      ),
      brightness: appTheme.brightness,
      appBarTheme: appTheme.appBarThem,
      scaffoldBackgroundColor: appTheme.lightColor,
      primaryColor: appTheme.primaryColor,
      disabledColor: appTheme.disableColor,
      highlightColor: appTheme.primaryColor,
      primaryColorLight: appTheme.textColor,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: appTheme.materialPrimaryColor,
      )
          .copyWith(secondary: appTheme.accentColor)
          .copyWith(background: appTheme.lightColor),
    );
  }
}
