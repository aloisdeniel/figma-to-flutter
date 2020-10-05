import 'package:example/credentials.dart';
import 'package:figma_theme/figma_theme.dart';
import 'package:flutter/widgets.dart';

part 'theme.g.dart';

final d = BorderSide(
  style: BorderStyle.solid,
  color: Color(0xFF),
  width: 5.0,
);

final s = BorderRadius.only(topLeft: Radius.circular(5.0));

@FigmaTheme(
  1,
  fileKey: fileKey,
  apiToken: apiToken,
)
class ExampleTheme extends InheritedWidget {
  final ExampleThemeData data;
  ExampleTheme({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(
          key: key,
          child: child,
        );

  static ExampleThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleTheme>()?.data ??
        ExampleThemeData.fallback();
  }

  @override
  bool updateShouldNotify(ExampleTheme oldWidget) {
    return oldWidget.data != data;
  }
}
