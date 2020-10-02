import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/rendering/layouts/auto_layout.dart';

class FigmaAutoLayout extends MultiChildRenderObjectWidget {
  final Size designSize;
  FigmaAutoLayout({
    Key key,
    @required this.designSize,
    this.layoutMode = figma.LayoutMode.vertical,
    this.counterAxisSizingMode = figma.CounterAxisSizingMode.auto,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.itemSpacing = 0,
    List<Widget> children = const <Widget>[],
  })  : assert(layoutMode != null && layoutMode != figma.LayoutMode.none),
        super(
          key: key,
          children: children,
        );

  final figma.LayoutMode layoutMode;
  final figma.CounterAxisSizingMode counterAxisSizingMode;
  final num horizontalPadding;
  final num verticalPadding;
  final num itemSpacing;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderFigmaAutoLayout(
      designSize: designSize,
      layoutMode: layoutMode ?? figma.LayoutMode.none,
      counterAxisSizingMode:
          counterAxisSizingMode ?? figma.CounterAxisSizingMode.auto,
      horizontalPadding: horizontalPadding ?? 0.0,
      verticalPadding: verticalPadding ?? 0.0,
      itemSpacing: itemSpacing ?? 0.0,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderFigmaAutoLayout renderObject) {
    renderObject
      ..designSize = designSize
      ..layoutMode = layoutMode ?? figma.LayoutMode.none
      ..counterAxisSizingMode =
          counterAxisSizingMode ?? figma.CounterAxisSizingMode.auto
      ..horizontalPadding = horizontalPadding ?? 0.0
      ..verticalPadding = verticalPadding ?? 0.0
      ..itemSpacing = itemSpacing ?? 0.0;
  }
}

class FigmaAutoData extends ContainerBoxParentData<RenderBox> {
  figma.LayoutAlign layoutAlign;
  bool isMainAxisFixed;
  bool isCrossAxisFixed;
  Size designSize;
  @override
  String toString() =>
      '${super.toString()}; size=$designSize; layoutAlign=$layoutAlign; isMainAxisFixed=$isMainAxisFixed';
}

class FigmaAuto extends ParentDataWidget<FigmaAutoData> {
  const FigmaAuto({
    Key key,
    @required this.layoutAlign,
    @required this.designSize,
    @required this.isMainAxisFixed,
    @required this.isCrossAxisFixed,
    @required Widget child,
  }) : super(key: key, child: child);

  final figma.LayoutAlign layoutAlign;
  final Size designSize;
  final bool isMainAxisFixed;
  final bool isCrossAxisFixed;

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is FigmaAutoData);
    final parentData = renderObject.parentData as FigmaAutoData;
    var needsLayout = false;

    if (parentData.layoutAlign != layoutAlign) {
      parentData.layoutAlign = layoutAlign;
      needsLayout = true;
    }

    if (parentData.isMainAxisFixed != isMainAxisFixed) {
      parentData.isMainAxisFixed = isMainAxisFixed;
      needsLayout = true;
    }

    if (parentData.isCrossAxisFixed != isCrossAxisFixed) {
      parentData.isCrossAxisFixed = isCrossAxisFixed;
      needsLayout = true;
    }

    if (parentData.designSize != designSize) {
      parentData.designSize = designSize;
      needsLayout = true;
    }

    if (needsLayout) {
      final targetParent = renderObject.parent;
      if (targetParent is RenderObject) targetParent.markNeedsLayout();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => FigmaAutoLayout;
}
