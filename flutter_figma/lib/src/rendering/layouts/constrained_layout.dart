import 'dart:math' as math;

import 'package:figma/figma.dart' as figma;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_figma/src/widgets/layouts/constrained_layout.dart';

class RenderFigmaConstrainedLayout extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, FigmaConstrainedData>,
        RenderBoxContainerDefaultsMixin<RenderBox, FigmaConstrainedData>,
        DebugOverflowIndicatorMixin {
  RenderFigmaConstrainedLayout({
    List<RenderBox> children,
    @required Size designSize,
  }) {
    _designSize = designSize;
    addAll(children);
  }

  Size _designSize;
  Size get designSize => _designSize;
  set designSize(Size value) {
    assert(value != null);
    if (_designSize != value) {
      _designSize = value;
      markNeedsLayout();
    }
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! FigmaConstrainedData) {
      child.parentData = FigmaConstrainedData();
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) =>
      _computeIntrinsicWidth(height, true);

  @override
  double computeMaxIntrinsicWidth(double height) =>
      _computeIntrinsicWidth(height, false);

  @override
  double computeMinIntrinsicHeight(double width) =>
      _computeIntrinsicHeight(width, true);

  @override
  double computeMaxIntrinsicHeight(double width) =>
      _computeIntrinsicHeight(width, false);

  @override
  void performLayout() {
    assert(constraints != null);

    size = Size(
      constraints.biggest.width.isFinite
          ? constraints.biggest.width
          : designSize.width,
      constraints.biggest.height.isFinite
          ? constraints.biggest.height
          : designSize.height,
    );

    var child = firstChild;

    while (child != null) {
      final childParentData = child.parentData as FigmaConstrainedData;
      final position = childParentData.designPosition;
      final isStretchHorizontal = childParentData.constraints.horizontal ==
          figma.HorizontalConstraint.leftRight;
      final isStretchVertical = childParentData.constraints.vertical ==
          figma.VerticalConstraint.topBottom;

      double minWidth, maxWidth, minHeight, maxHeight;

      if (isStretchHorizontal) {
        final width = size.width -
            (position.dx) -
            (size.width - (position.dx + childParentData.designSize.width));
        minWidth = width;
        maxWidth = width;
      } else {
        minWidth = childParentData.designSize.width;
        maxWidth = childParentData.designSize.width;
      }

      if (isStretchVertical) {
        final height = size.height -
            (position.dy) -
            (size.height - (position.dy + childParentData.designSize.height));
        minHeight = height;
        maxHeight = height;
      } else {
        minHeight = childParentData.designSize.height;
        maxHeight = childParentData.designSize.height;
      }

      final innerConstraints = BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      );
      child.layout(innerConstraints);

      double x, y;
      switch (childParentData.constraints.horizontal) {
        case figma.HorizontalConstraint.right:
          x = size.width - (designSize.width - position.dx);
          break;
        case figma.HorizontalConstraint.center:
          x = size.width / 2 - (designSize.width / 2 - position.dx);
          break;

        default:
          x = position.dx;
      }

      switch (childParentData.constraints.vertical) {
        case figma.VerticalConstraint.bottom:
          y = size.height - (designSize.height - position.dy);
          break;
        default:
          y = position.dy;
      }

      childParentData.offset = Offset(x, y);

      child = childParentData.nextSibling;
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
    return;
  }

  double _computeIntrinsicWidth(double height, bool minChild) {
    var size = 0.0;
    var child = firstChild;
    while (child != null) {
      final childParentData = child.parentData as FigmaConstrainedData;
      final position = childParentData.designPosition;
      final mainSize = minChild
          ? child.getMinIntrinsicWidth(height - position.dx)
          : child.getMaxIntrinsicWidth(double.infinity);

      size = math.max(size, position.dx + mainSize);
      child = childParentData.nextSibling;
    }
    return size;
  }

  double _computeIntrinsicHeight(double width, bool minChild) {
    var size = 0.0;
    var child = firstChild;
    while (child != null) {
      final childParentData = child.parentData as FigmaConstrainedData;
      final position = childParentData.designPosition;
      final mainSize = minChild
          ? child.getMinIntrinsicHeight(width - position.dy)
          : child.getMaxIntrinsicHeight(double.infinity);

      size = math.max(size, position.dy + mainSize);
      child = childParentData.nextSibling;
    }
    return size;
  }
}
