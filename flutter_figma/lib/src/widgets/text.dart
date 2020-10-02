import 'package:figma/figma.dart' as figma;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';

class FigmaText extends StatelessWidget {
  final figma.Text node;
  FigmaText({
    Key key,
    @required this.node,
  }) : super(
          key: key ?? (node.id != null ? Key(node.id) : null),
        );

  TextStyle _defaultStyle() {
    final color = node.fills
        .firstWhere(
          (x) => x.color != null,
          orElse: () => null,
        )
        ?.color
        ?.toFlutterColor();
    var style = node.style.toFlutterTextStyle();
    style = style.copyWith(color: color ?? style.color);
    return style;
  }

  Widget _uniqueStyle(BuildContext context) {
    return Text(
      node.characters,
      style: _defaultStyle(),
    );
  }

  Widget _multipleStyles(BuildContext context) {
    final defaultStyle = _defaultStyle();
    final styleTable = node.styleOverrideTable.map((key, value) {
      return MapEntry(
        key,
        defaultStyle.merge(value.toFlutterTextStyle()),
      );
    });
    styleTable[0] = defaultStyle;
    final children = <InlineSpan>[];

    var currentStyle = 0;
    var currentSlice = '';
    for (var i = 0; i < node.characterStyleOverrides.length; i++) {
      final styleIndex = node.characterStyleOverrides[i];
      if (styleIndex != currentStyle && currentSlice.isNotEmpty) {
        children.add(TextSpan(
          text: currentSlice,
          style: styleTable[currentStyle],
        ));
        currentSlice = '';
      }
      currentSlice = '$currentSlice${node.characters[i]}';
      currentStyle = styleIndex;
    }

    if (currentSlice.isNotEmpty) {
      children.add(
        TextSpan(
          text: currentSlice,
          style: styleTable[currentStyle],
        ),
      );
    }

    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var child = node.characterStyleOverrides.isNotEmpty
        ? _multipleStyles(context)
        : _uniqueStyle(context);

    if (node.opacity != null && node.opacity < 1) {
      child = Opacity(
        opacity: node.opacity,
        child: child,
      );
    }

    return child;
  }
}
