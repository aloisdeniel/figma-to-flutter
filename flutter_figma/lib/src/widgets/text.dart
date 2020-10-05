import 'package:figma/figma.dart' as figma;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';

import 'layouts/rotated.dart';

class FigmaText extends StatelessWidget {
  final figma.Text node;
  final TextAlign textAlign;
  final TextStyle defaultStyle;
  final List<InlineSpan> spans;

  const FigmaText({
    Key key,
    @required this.node,
    @required this.spans,
    @required this.textAlign,
    @required this.defaultStyle,
  }) : super(key: key);

  factory FigmaText.api(figma.Text node) {
    final defaultStyle = _buildDefaultStyle(node);
    final styleTable = _buildStyleTable(node, defaultStyle);
    return FigmaText(
      key: node.id != null ? Key(node.id) : null,
      node: node,
      defaultStyle: defaultStyle,
      spans: _buildSpans(node, styleTable),
      textAlign: () {
        switch (node.style.textAlignHorizontal) {
          case figma.TextAlignHorizontal.right:
            return TextAlign.right;
          case figma.TextAlignHorizontal.center:
            return TextAlign.center;
          case figma.TextAlignHorizontal.justified:
            return TextAlign.justify;
          default:
            return TextAlign.left;
        }
      }(),
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
        textAlign: textAlign,
        text: TextSpan(
          style: defaultStyle,
          children: spans,
        ),
      );
    } else {
      child = Text(
        node.characters,
        textAlign: textAlign,
        style: defaultStyle,
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
