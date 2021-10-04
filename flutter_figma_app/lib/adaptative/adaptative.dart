import 'package:flutter/widgets.dart';

import 'data.dart';

class AppAdaptative extends InheritedWidget {
  const AppAdaptative({
    Key? key,
    this.data,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final AppAdaptativeData? data;

  static AppAdaptativeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppAdaptative>()?.data ??
        AppAdaptativeData.fallback(context);
  }

  @override
  bool updateShouldNotify(covariant AppAdaptative oldWidget) {
    return data != oldWidget.data;
  }
}
