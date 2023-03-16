import 'package:flutter/material.dart';
import 'package:websocket_app/app/theme/app_colors.dart';

class LightTheme implements AppColorsTheme {
  static const _primaryColor = Color.fromRGBO(229, 104, 3, 1);
  static const _lightColor = Color(0xF9FFFFFF);
  static const Map<int, Color> _primaryColors = {
    50: Color.fromRGBO(255, 255, 255, .1),
    100: Color.fromRGBO(255, 255, 255, .2),
    200: Color.fromRGBO(255, 255, 255, .3),
    300: Color.fromRGBO(255, 255, 255, .4),
    400: Color.fromRGBO(255, 255, 255, .5),
    500: Color.fromRGBO(255, 255, 255, .6),
    600: Color.fromRGBO(255, 255, 255, .7),
    700: Color.fromRGBO(255, 255, 255, .8),
    800: Color(0xF1FFFFFF),
    900: Color(0xF9FFFFFF),
  };

  @override
  Map<int, Color> get primaryColors => _primaryColors;

  @override
  Color get primaryColor => _primaryColor;

  @override
  Color get secondaryColor => const Color.fromRGBO(229, 104, 3, 1);

  @override
  Color get disableColor => const Color.fromRGBO(229, 104, 3, 0.6);

  @override
  Color get lightColor => _lightColor;

  @override
  List<Color> get lightGradientColor =>
      const <Color>[_primaryColor, _lightColor];

  @override
  Color get accentColor => const Color(0xF9FFFFFF);

  @override
  Color get defaultColor => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get textColor => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get shimmerBackground => Colors.grey.shade400;

  @override
  Color get shimmerAnimated => Colors.grey.shade100;

  @override
  MaterialColor get materialPrimaryColor =>
      const MaterialColor(0xFF292342, _primaryColors);

  @override
  Brightness get brightness => Brightness.light;

  @override
  AppBarTheme get appBarThem =>
      ThemeData.light().appBarTheme.copyWith(color: accentColor);
}
