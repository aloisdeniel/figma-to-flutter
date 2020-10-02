import 'package:figma/figma.dart' as figma;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';

import 'layouts/rotated.dart';

class FigmaText extends StatelessWidget {
  final figma.Text node;
  final TextStyle defaultStyle;
  final Map<int, TextStyle> styleTable;
  final List<InlineSpan> spans;

  FigmaText._({
    Key key,
    @required this.node,
    @required this.spans,
    @required this.styleTable,
    @required this.defaultStyle,
  }) : super(
          key: key ?? (node.id != null ? Key(node.id) : null),
        );

  factory FigmaText({
    Key key,
    @required figma.Text node,
  }) {
    final defaultStyle = _buildDefaultStyle(node);
    final styleTable = _buildStyleTable(node, defaultStyle);
    return FigmaText._(
      node: node,
      defaultStyle: defaultStyle,
      spans: _buildSpans(node, styleTable),
      styleTable: styleTable,
    );
  }

  static TextStyle _buildDefaultStyle(figma.Text node) {
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

  static Map<int, TextStyle> _buildStyleTable(
      figma.Text node, TextStyle defaultStyle) {
    final styleTable = node.styleOverrideTable.map((key, value) {
      return MapEntry(
        key,
        defaultStyle.merge(value.toFlutterTextStyle()),
      );
    });
    styleTable[0] = defaultStyle;
    return styleTable;
  }

  static List<InlineSpan> _buildSpans(
      figma.Text node, Map<int, TextStyle> styleTable) {
    final children = <InlineSpan>[];

    if (node.characterStyleOverrides.isNotEmpty) {
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
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (spans.isNotEmpty) {
      child = RichText(
        text: TextSpan(
          style: defaultStyle,
          children: spans,
        ),
      );
    } else {
      Text(
        node.characters,
        style: styleTable[0],
      );
    }

    if (node.opacity != null && node.opacity < 1) {
      child = Opacity(
        opacity: node.opacity,
        child: child,
      );
    }

    if (node.relativeTransform != null && node.relativeTransform.isRotated) {
      child = FigmaRotated(
        transform: node.relativeTransform,
        child: child,
      );
    }

    return child;
  }
}
