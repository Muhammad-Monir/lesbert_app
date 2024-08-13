import 'package:flutter/material.dart';
import '../gen/colors.gen.dart';


final class CustomTheme {
  CustomTheme._();
  static const MaterialColor kToDark = MaterialColor(
    0xFF073D71, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFF073D71), //10%
      100: Color(0xFF073D71), //20%
      200: Color(0xFF073D71), //30%
      300: Color(0xFF073D71), //40%
      400: Color(0xFF073D71), //50%
      500: Color(0xFF073D71), //60%
      600: Color(0xFF073D71), //70%
      700: Color(0xFF073D71), //80%
      800: Color(0xFF073D71), //80%
      900: Color(0xFF073D71), //80%
    },
  );
  static ThemeData get mainTheme {
    return ThemeData(
      primaryColor: AppColors.allPrimaryColor,
      primarySwatch: CustomTheme.kToDark,
      scaffoldBackgroundColor: AppColors.scaffoldColor,
    );
  }
}
