import 'package:figma/figma.dart';
import 'package:flutter/material.dart';

class Figma extends InheritedWidget {
  final FigmaClient api;

  Figma({
    Key key,
    @required Widget child,
    @required String token,
  })  : assert(token != null),
        api = FigmaClient(token),
        super(
          key: key,
          child: child,
        );

  static Figma of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Figma>();
  }

  @override
  bool updateShouldNotify(Figma oldWidget) {
    return api.accessToken != oldWidget.api.accessToken;
  }
}
