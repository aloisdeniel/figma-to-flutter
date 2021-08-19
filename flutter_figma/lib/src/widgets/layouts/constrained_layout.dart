import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/rendering/layouts/constrained_layout.dart';
import 'package:figma/figma.dart' as figma;

class FigmaConstrainedLayout extends MultiChildRenderObjectWidget {
  final Size designSize;
  FigmaConstrainedLayout({
    Key? key,
    required this.designSize,
    List<Widget> children = const <Widget>[],
  }) : super(
          key: key,
          children: children,
        );

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderFigmaConstrainedLayout(
      designSize: designSize,
    );
  }

  @override
  void updateRenderObject(BuildContext context,
      covariant RenderFigmaConstrainedLayout renderObject) {
    renderObject..designSize = designSize;
  }
}

class FigmaConstrainedData extends ContainerBoxParentData<RenderBox> {
  figma.LayoutConstraint? constraints;
  Size? designSize;
  Offset? designPosition;
  @override
  String toString() =>
      '${super.toString()}; designSize=$designSize; designPosition=$designPosition; constraints=$constraints';
}

class FigmaConstrained extends ParentDataWidget<FigmaConstrainedData> {
  const FigmaConstrained({
    Key? key,
    required this.constraints,
    required this.designSize,
    required this.designPosition,
    required Widget child,
  }) : super(key: key, child: child);

  final figma.LayoutConstraint constraints;
  final Size designSize;
  final Offset designPosition;

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is FigmaConstrainedData);
    final parentData = renderObject.parentData as FigmaConstrainedData;
    var needsLayout = false;

    if (parentData.constraints != constraints) {
      parentData.constraints = constraints;
      needsLayout = true;
    }

    if (parentData.designSize != designSize) {
      parentData.designSize = designSize;
      needsLayout = true;
    }

    if (parentData.designPosition != designPosition) {
      parentData.designPosition = designPosition;
      needsLayout = true;
    }

    if (needsLayout) {
      final targetParent = renderObject.parent;
      if (targetParent is RenderObject) targetParent.markNeedsLayout();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => FigmaConstrainedLayout;
}
