import 'package:figma/figma.dart';
import 'package:flutter/material.dart';

class FlutterFigma extends InheritedWidget {
  final FigmaClient api;

  FlutterFigma({
    Key? key,
    required Widget child,
    required String token,
  })  : api = FigmaClient(token),
        super(
          key: key,
          child: child,
        );

  static FlutterFigma? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FlutterFigma>();
  }

  @override
  bool updateShouldNotify(FlutterFigma oldWidget) {
    return api.accessToken != oldWidget.api.accessToken;
  }
}
