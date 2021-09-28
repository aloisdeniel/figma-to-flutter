import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/layouts/home/layout.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditorApp extends StatelessWidget {
  const EditorApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = ThemeData.dark();
    theme = theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: const MaterialColor(
          0xFFFF4831,
          {
            50: Color(0xFFFF4831),
            100: Color(0xFFFF4831),
            200: Color(0xFFFF4831),
            300: Color(0xFFFF4831),
            400: Color(0xFFFF4831),
            500: Color(0xFFFF4831),
            600: Color(0xFFFF4831),
            700: Color(0xFFFF4831),
            800: Color(0xFFFF4831),
            900: Color(0xFFFF4831),
          },
        ),
        secondary: const MaterialColor(
          0xFFFF4831,
          {
            50: Color(0xFFFF4831),
            100: Color(0xFFFF4831),
            200: Color(0xFFFF4831),
            300: Color(0xFFFF4831),
            400: Color(0xFFFF4831),
            500: Color(0xFFFF4831),
            600: Color(0xFFFF4831),
            700: Color(0xFFFF4831),
            800: Color(0xFFFF4831),
            900: Color(0xFFFF4831),
          },
        ),
      ),
    );
    return AppTheme(
      child: ProviderScope(
        child: MaterialApp(
          darkTheme: theme,
          themeMode: ThemeMode.dark,
          home: const HomeLayout(),
        ),
      ),
    );
  }
}
