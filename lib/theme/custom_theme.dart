import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: const Color(0xFFDF00FD),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFFDF00FD),
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: const Color(0xFFDF00FD))
          .copyWith(secondary: Colors.white.withOpacity(0.3))
          .copyWith(tertiary: const Color(0xFF7F00FF))
          .copyWith(surface: const Color(0xFF6C6C6C).withOpacity(0.2))
          .copyWith(surfaceVariant: const Color(0x00000000).withOpacity(0.2))
          .copyWith(background: const Color(0xff20042d)),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: const Color(0xFFDF00FD),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFFDF00FD),
        textTheme: ButtonTextTheme.primary,
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: const Color(0xFFDF00FD))
          .copyWith(secondary: Colors.white.withOpacity(0.3))
          .copyWith(tertiary: const Color(0xFF7F00FF))
          .copyWith(surface: const Color(0xFF6C6C6C).withOpacity(0.2))
          .copyWith(surfaceVariant: const Color(0x00000000).withOpacity(0.2))
          .copyWith(background: const Color(0xff20042d)),
    );
  }
}
