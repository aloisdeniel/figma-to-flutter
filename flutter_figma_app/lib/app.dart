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
    return AppTheme(
      child: Builder(
        builder: (context) {
          var theme = ThemeData.dark();
          final appTheme = AppTheme.of(context);
          theme = theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: MaterialColor(
                appTheme.color.primary1.value,
                {
                  50: appTheme.color.primary1,
                  100: appTheme.color.primary1,
                  200: appTheme.color.primary1,
                  300: appTheme.color.primary1,
                  400: appTheme.color.primary1,
                  500: appTheme.color.primary1,
                  600: appTheme.color.primary1,
                  700: appTheme.color.primary1,
                  800: appTheme.color.primary1,
                  900: appTheme.color.primary1,
                },
              ),
              secondary: MaterialColor(
                appTheme.color.primary1.value,
                {
                  50: appTheme.color.primary1,
                  100: appTheme.color.primary1,
                  200: appTheme.color.primary1,
                  300: appTheme.color.primary1,
                  400: appTheme.color.primary1,
                  500: appTheme.color.primary1,
                  600: appTheme.color.primary1,
                  700: appTheme.color.primary1,
                  800: appTheme.color.primary1,
                  900: appTheme.color.primary1,
                },
              ),
            ),
          );
          return ProviderScope(
            child: MaterialApp(
              darkTheme: theme,
              themeMode: ThemeMode.dark,
              home: const HomeLayout(),
            ),
          );
        },
      ),
    );
  }
}
