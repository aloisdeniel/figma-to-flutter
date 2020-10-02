import 'dart:math' as math;
import 'package:figma/figma.dart' as figma;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_figma/src/widgets/layouts/auto_layout.dart';

class RenderFigmaAutoLayout extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, FigmaAutoData>,
        RenderBoxContainerDefaultsMixin<RenderBox, FigmaAutoData>,
        DebugOverflowIndicatorMixin {
  RenderFigmaAutoLayout({
    List<RenderBox> children,
    @required figma.LayoutMode layoutMode,
    @required Size designSize,
    @required figma.CounterAxisSizingMode counterAxisSizingMode,
    @required num horizontalPadding,
    @required num verticalPadding,
    @required num itemSpacing,
  })  : _layoutMode = layoutMode,
        _designSize = designSize,
        _counterAxisSizingMode = counterAxisSizingMode,
        _horizontalPadding = horizontalPadding,
        _verticalPadding = verticalPadding,
        _itemSpacing = itemSpacing {
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

  figma.LayoutMode _layoutMode;
  figma.LayoutMode get layoutMode => _layoutMode;
  set layoutMode(figma.LayoutMode value) {
    assert(value != null);
    if (_layoutMode != value) {
      _layoutMode = value;
      markNeedsLayout();
    }
  }

  figma.CounterAxisSizingMode _counterAxisSizingMode;
  figma.CounterAxisSizingMode get counterAxisSizingMode =>
      _counterAxisSizingMode;
  set counterAxisSizingMode(figma.CounterAxisSizingMode value) {
    assert(value != null);
    if (_counterAxisSizingMode != value) {
      _counterAxisSizingMode = value;
      markNeedsLayout();
    }
  }

  num _horizontalPadding;
  num get horizontalPadding => _horizontalPadding;
  set horizontalPadding(num value) {
    assert(value != null);
    if (_horizontalPadding != value) {
      _horizontalPadding = value;
      markNeedsLayout();
    }
  }

  num _verticalPadding;
  num get verticalPadding => _verticalPadding;
  set verticalPadding(num value) {
    assert(value != null);
    if (_verticalPadding != value) {
      _verticalPadding = value;
      markNeedsLayout();
    }
  }

  num _itemSpacing;
  num get itemSpacing => _itemSpacing;
  set itemSpacing(num value) {
    assert(value != null);
    if (_itemSpacing != value) {
      _itemSpacing = value;
      markNeedsLayout();
    }
  }

  // Set during layout if overflow occurred on the main axis.
  double _overflow;
  // Check whether any meaningful overflow is present. Values below an epsilon
  // are treated as not overflowing.
  bool get _hasOverflow => false; // _overflow > precisionErrorTolerance;

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! FigmaAutoData) {
      child.parentData = FigmaAutoData();
    }
  }

  @override
  void detach() {
    super.detach();
    // Since we're disposing of our painter, we won't receive change
    // notifications. We mark ourselves as needing paint so that we will
    // resubscribe to change notifications. If we didn't do this, then, for
    // example, animated GIFs would stop animating when a DecoratedBox gets
    // moved around the tree due to GlobalKey reparenting.
    markNeedsPaint();
  }

  double _computeIntrinsicWidth(double height, bool minChild) {
    // We should get the maximum child of children or fixed
    if (layoutMode == figma.LayoutMode.vertical) {
      if (counterAxisSizingMode == figma.CounterAxisSizingMode.fixed) {
        return designSize.width;
      }
      var size = horizontalPadding * 2;
      var child = firstChild;
      while (child != null) {
        final mainSize = child.getMinIntrinsicWidth(height);
        size = math.max(size, mainSize);
        final childParentData = child.parentData as FigmaAutoData;
        child = childParentData.nextSibling;
      }
      return size;
    }

    // We should add all children widths
    var size = horizontalPadding * 2.0;
    var child = firstChild;
    while (child != null) {
      final mainSize = minChild
          ? child.getMinIntrinsicWidth(double.infinity)
          : child.getMaxIntrinsicWidth(double.infinity);
      final childParentData = child.parentData as FigmaAutoData;
      size += mainSize;
      child = childParentData.nextSibling;
      if (child != null) size += itemSpacing;
    }
    return size;
  }

  double _computeIntrinsicHeight(double width, bool minChild) {
    // We should get the maximum child of children or fixed
    if (layoutMode == figma.LayoutMode.horizontal) {
      if (counterAxisSizingMode == figma.CounterAxisSizingMode.fixed) {
        return designSize.height;
      }
      var size = verticalPadding * 2;
      var child = firstChild;
      while (child != null) {
        final mainSize = child.getMinIntrinsicHeight(width);
        size = math.max(size, mainSize);
        final childParentData = child.parentData as FigmaAutoData;
        child = childParentData.nextSibling;
      }
      return size;
    }

    // We should add all children heights
    var size = verticalPadding * 2;
    var child = firstChild;
    while (child != null) {
      final mainSize = minChild
          ? child.getMinIntrinsicHeight(double.infinity)
          : child.getMaxIntrinsicHeight(double.infinity);
      final childParentData = child.parentData as FigmaAutoData;
      size += mainSize;
      child = childParentData.nextSibling;
      if (child != null) size += itemSpacing;
    }
    return size;
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

    double constraintsMaxCross;
    double constraintsMinCross;
    double constraintsMaxMain;
    double constraintsMinMain;
    double crossPadding;
    double mainPadding;

    final isHorizontal = layoutMode == figma.LayoutMode.horizontal;
    final isCrossFixed =
        counterAxisSizingMode == figma.CounterAxisSizingMode.fixed;

    if (isHorizontal) {
      constraintsMinCross = constraints.minHeight;
      constraintsMaxCross = constraints.maxHeight;
      if (isCrossFixed) {
        constraintsMaxCross = designSize.height.clamp(0.0, constraintsMaxCross);
        constraintsMinCross = constraintsMaxCross;
      }
      constraintsMinMain = constraints.minWidth;
      constraintsMaxMain = constraints.maxWidth;
      crossPadding = verticalPadding ?? 0.0;
      mainPadding = horizontalPadding ?? 0.0;
    } else {
      constraintsMinCross = constraints.minWidth;
      constraintsMaxCross = constraints.maxWidth;
      if (isCrossFixed) {
        constraintsMaxCross = designSize.width.clamp(0.0, constraintsMaxCross);
        constraintsMinCross = constraintsMaxCross;
      }
      constraintsMinMain = constraints.minHeight;
      constraintsMaxMain = constraints.maxHeight;
      crossPadding = horizontalPadding ?? 0.0;
      mainPadding = verticalPadding ?? 0.0;
    }

    var child = firstChild;

    // Children stretched along the cross axis
    final stretchedChildren = <RenderBox>[];

    // 1. we calculate children sizes

    var cross = 2 * crossPadding;
    final maxChildCross = constraintsMaxCross.isInfinite
        ? constraintsMaxCross
        : math.max(constraintsMaxCross - 2 * crossPadding, 0.0);

    while (child != null) {
      final childParentData = child.parentData as FigmaAutoData;
      if (childParentData.layoutAlign == figma.LayoutAlign.stretch) {
        stretchedChildren.add(child);
      } else {
        final childConstraints = isHorizontal
            ? BoxConstraints(
                minHeight: childParentData.isCrossAxisFixed
                    ? childParentData.designSize.height
                    : 0.0,
                maxHeight: childParentData.isCrossAxisFixed
                    ? childParentData.designSize.height
                    : maxChildCross,
                minWidth: childParentData.isMainAxisFixed
                    ? childParentData.designSize.width
                    : 0.0,
                maxWidth: childParentData.isMainAxisFixed
                    ? childParentData.designSize.width
                    : double.infinity,
              )
            : BoxConstraints(
                minHeight: childParentData.isMainAxisFixed
                    ? childParentData.designSize.height
                    : 0.0,
                maxHeight: childParentData.isMainAxisFixed
                    ? childParentData.designSize.height
                    : double.infinity,
                minWidth: childParentData.isCrossAxisFixed
                    ? childParentData.designSize.width
                    : 0.0,
                maxWidth: childParentData.isCrossAxisFixed
                    ? childParentData.designSize.width
                    : maxChildCross,
              );

        child.layout(
          childConstraints,
          parentUsesSize: true,
        );

        if (!isCrossFixed) {
          final childCross =
              isHorizontal ? child.size.height : child.size.width;
          cross = math.max(cross, childCross + crossPadding * 2);
        }
      }

      child = childParentData.nextSibling;
    }

    cross = cross.clamp(
      constraintsMinCross,
      constraintsMaxCross,
    );

    // 2. Layout of stretched items
    for (var child in stretchedChildren) {
      final childParentData = child.parentData as FigmaAutoData;
      final innerConstraints = isHorizontal
          ? BoxConstraints(
              minHeight: maxChildCross,
              maxHeight: maxChildCross,
              minWidth: childParentData.isMainAxisFixed
                  ? childParentData.designSize.width
                  : 0.0,
              maxWidth: childParentData.isMainAxisFixed
                  ? childParentData.designSize.width
                  : double.infinity,
            )
          : BoxConstraints(
              minHeight: childParentData.isMainAxisFixed
                  ? childParentData.designSize.height
                  : 0.0,
              maxHeight: childParentData.isMainAxisFixed
                  ? childParentData.designSize.height
                  : double.infinity,
              minWidth: maxChildCross,
              maxWidth: maxChildCross,
            );
      child.layout(
        innerConstraints,
        parentUsesSize: true,
      );
    }

    // 2. we update children position along the main axis
    child = firstChild;
    var main = mainPadding;
    while (child != null) {
      final childParentData = child.parentData as FigmaAutoData;
      final childCross = isHorizontal ? child.size.height : child.size.width;
      final childMain = isHorizontal ? child.size.width : child.size.height;

      double crossOffset;
      switch (childParentData.layoutAlign) {
        case figma.LayoutAlign.center:
          crossOffset = (cross / 2) - (childCross / 2);
          break;
        case figma.LayoutAlign.max:
          crossOffset = cross - crossPadding - childCross;
          break;
        default:
          crossOffset = crossPadding;
      }

      childParentData.offset = isHorizontal
          ? Offset(
              main,
              crossOffset,
            )
          : Offset(
              crossOffset,
              main,
            );

      main += childMain;
      child = childParentData.nextSibling;
      if (child != null) main += itemSpacing;
    }

    main += mainPadding;

    if (!isHorizontal) {
      size = Size(
        cross,
        main.clamp(
          constraints.smallest.height,
          constraints.biggest.height,
        ),
      );
    } else {
      size = Size(
        main.clamp(
          constraints.smallest.width,
          constraints.biggest.width,
        ),
        cross,
      );
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

  @override
  String toStringShort() {
    var header = super.toStringShort();
    if (_overflow is double && _hasOverflow) header += ' OVERFLOWING';
    return header;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<figma.LayoutMode>('layoutMode', layoutMode));
    properties.add(EnumProperty<figma.CounterAxisSizingMode>(
        'counterAxisSizingMode', counterAxisSizingMode));
    properties.add(EnumProperty<num>('verticalPadding', verticalPadding));
    properties.add(EnumProperty<num>('horizontalPadding', horizontalPadding));
    properties.add(EnumProperty<num>('itemSpacing', itemSpacing));
  }
}
