import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/data.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    Key? key,
    this.data,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final AppThemeData? data;

  static AppThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()?.data ??
        AppThemeData.fallback();
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}
