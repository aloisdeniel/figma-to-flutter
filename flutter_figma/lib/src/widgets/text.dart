import 'package:figma/figma.dart' as figma;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';

import 'layouts/rotated.dart';

class FigmaText extends StatelessWidget {
  final String characters;
  final double? opacity;
  final TextAlign textAlign;
  final TextStyle? defaultStyle;
  final List<List<num>>? relativeTransform;
  final List<InlineSpan> spans;

  const FigmaText({
    Key? key,
    required this.characters,
    required this.defaultStyle,
    this.opacity,
    this.spans = const <InlineSpan>[],
    this.textAlign = TextAlign.start,
    this.relativeTransform,
  }) : super(key: key);

  factory FigmaText.api(figma.Text node, {String? package}) {
    final defaultStyle = _buildDefaultStyle(node, package);
    final styleTable = _buildStyleTable(node, defaultStyle, package);
    return FigmaText(
      key: Key(node.id),
      characters: node.characters ?? '',
      opacity: node.opacity,
      relativeTransform: node.relativeTransform,
      defaultStyle: defaultStyle,
      spans: _buildSpans(node, styleTable),
      textAlign: () {
        switch (node.style?.textAlignHorizontal) {
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

  static TextStyle _buildDefaultStyle(
    figma.Text node,
    String? package,
  ) {
    final color = node.fills
        ?.firstWhere(
          (x) => x.color != null,
          orElse: () => figma.Paint(visible: true),
        )
        .color
        ?.toFlutterColor();
    var style = node.style?.toFlutterTextStyle(package);
    style = style?.copyWith(color: color ?? style.color);
    return style ?? TextStyle();
  }

  static Map<int, TextStyle> _buildStyleTable(
    figma.Text node,
    TextStyle defaultStyle,
    String? package,
  ) {
    final styleOverrides = node.styleOverrideTable;
    if (styleOverrides != null) {
      final styleTable = styleOverrides.map((key, value) {
        return MapEntry(
          key,
          defaultStyle.merge(value.toFlutterTextStyle(package)),
        );
      });
      styleTable[0] = defaultStyle;
      return styleTable;
    }
    return <int, TextStyle>{};
  }

  static List<InlineSpan> _buildSpans(
    figma.Text node,
    Map<int, TextStyle> styleTable,
  ) {
    final children = <InlineSpan>[];
    final characters = node.characters;
    final styleOverrides = node.characterStyleOverrides;
    if (characters != null &&
        characters.isNotEmpty &&
        styleOverrides != null &&
        styleOverrides.isNotEmpty) {
      var currentStyle = 0;
      var currentSlice = '';
      for (var i = 0; i < styleOverrides.length; i++) {
        final styleIndex = styleOverrides[i];
        if (styleIndex != currentStyle && currentSlice.isNotEmpty) {
          children.add(TextSpan(
            text: currentSlice,
            style: styleTable[currentStyle],
          ));
          currentSlice = '';
        }
        currentSlice = '$currentSlice${characters[i]}';
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

    final opacity = this.opacity;
    final relativeTransform = this.relativeTransform;

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
        characters,
        textAlign: textAlign,
        style: defaultStyle,
      );
    }

    if (opacity != null && opacity < 1) {
      child = Opacity(
        opacity: opacity,
        child: child,
      );
    }

    if (relativeTransform != null && relativeTransform.isRotated) {
      child = FigmaRotated(
        transform: relativeTransform,
        child: child,
      );
    }

    return child;
  }
}
