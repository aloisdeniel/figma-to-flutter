import 'dart:math' as math;
import 'package:figma/figma.dart' as figma;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_figma/src/widgets/layouts/auto_layout.dart';

class RenderFigmaAutoLayout extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, FigmaAutoData>,
        RenderBoxContainerDefaultsMixin<RenderBox, FigmaAutoData>,
        DebugOverflowIndicatorMixin {
  RenderFigmaAutoLayout({
    List<RenderBox> children = const <RenderBox>[],
    required figma.LayoutMode layoutMode,
    required Size designSize,
    required figma.CounterAxisSizingMode counterAxisSizingMode,
    required num itemSpacing,
    required EdgeInsets padding,
  })  : _layoutMode = layoutMode,
        _designSize = designSize,
        _padding = padding,
        _counterAxisSizingMode = counterAxisSizingMode,
        _itemSpacing = itemSpacing {
    addAll(children);
  }

  Size _designSize;
  Size get designSize => _designSize;
  set designSize(Size value) {
    if (_designSize != value) {
      _designSize = value;
      markNeedsLayout();
    }
  }

  figma.LayoutMode _layoutMode;
  figma.LayoutMode get layoutMode => _layoutMode;
  set layoutMode(figma.LayoutMode value) {
    if (_layoutMode != value) {
      _layoutMode = value;
      markNeedsLayout();
    }
  }

  figma.CounterAxisSizingMode _counterAxisSizingMode;
  figma.CounterAxisSizingMode get counterAxisSizingMode =>
      _counterAxisSizingMode;
  set counterAxisSizingMode(figma.CounterAxisSizingMode value) {
    if (_counterAxisSizingMode != value) {
      _counterAxisSizingMode = value;
      markNeedsLayout();
    }
  }

  EdgeInsets _padding;
  EdgeInsets get padding => _padding;
  set padding(EdgeInsets value) {
    if (_padding != value) {
      _padding = value;
      markNeedsLayout();
    }
  }

  num _itemSpacing;
  num get itemSpacing => _itemSpacing;
  set itemSpacing(num value) {
    if (_itemSpacing != value) {
      _itemSpacing = value;
      markNeedsLayout();
    }
  }

  // Set during layout if overflow occurred on the main axis.
  double? _overflow;
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
      var size = padding.vertical;
      var child = firstChild;
      while (child != null) {
        final mainSize = child.getMinIntrinsicWidth(height);
        size = math.max(size, mainSize);
        final childParentData = child.parentData as FigmaAutoData;
        child = childParentData.nextSibling;
      }
      return size.toDouble();
    }

    // We should add all children widths
    var size = padding.horizontal;
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
      var size = padding.vertical;
      var child = firstChild;
      while (child != null) {
        final mainSize = child.getMinIntrinsicHeight(width);
        size = math.max(size, mainSize);
        final childParentData = child.parentData as FigmaAutoData;
        child = childParentData.nextSibling;
      }
      return size.toDouble();
    }

    // We should add all children heights
    var size = padding.vertical;
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
    return size.toDouble();
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

  Size _calculateLayout({
    required Size layoutChild(RenderBox box, BoxConstraints constraints),
  }) {
    late double constraintsMaxCross;
    late double constraintsMinCross;
    late double constraintsMaxMain;
    late double constraintsMinMain;
    late double crossPaddingStart;
    late double crossPaddingEnd;
    late double mainPaddingStart;
    late double mainPaddingEnd;

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
      crossPaddingStart = padding.top;
      crossPaddingEnd = padding.bottom;
      mainPaddingStart = padding.left;
      mainPaddingEnd = padding.right;
    } else {
      constraintsMinCross = constraints.minWidth;
      constraintsMaxCross = constraints.maxWidth;
      if (isCrossFixed) {
        constraintsMaxCross = designSize.width.clamp(0.0, constraintsMaxCross);
        constraintsMinCross = constraintsMaxCross;
      }
      constraintsMinMain = constraints.minHeight;
      constraintsMaxMain = constraints.maxHeight;
      mainPaddingStart = padding.top;
      mainPaddingEnd = padding.bottom;
      crossPaddingStart = padding.left;
      crossPaddingEnd = padding.right;
    }

    var child = firstChild;

    // Children stretched along the cross axis
    final stretchedChildren = <RenderBox>[];
    final Map<RenderBox, Size> childSizes = {};

    // 1. we calculate children sizes

    var cross = crossPaddingStart + crossPaddingEnd;
    final maxChildCross = constraintsMaxCross.isInfinite
        ? constraintsMaxCross
        : math.max(constraintsMaxCross - cross, 0.0);

    while (child != null) {
      final childParentData = child.parentData as FigmaAutoData;
      if (childParentData.layoutAlign == figma.LayoutAlign.stretch) {
        stretchedChildren.add(child);
      } else {
        final isCrossAxisFixed = true;
        final isMainAxisFixed = childParentData.isMainAxisFixed ?? true;
        final designSize = childParentData.designSize ?? Size.zero;
        final childConstraints = isHorizontal
            ? BoxConstraints(
                minHeight: isCrossAxisFixed ? designSize.height : 0.0,
                maxHeight: isCrossAxisFixed ? designSize.height : maxChildCross,
                minWidth: isMainAxisFixed ? designSize.width : 0.0,
                maxWidth: isMainAxisFixed ? designSize.width : double.infinity,
              )
            : BoxConstraints(
                minHeight: isMainAxisFixed ? designSize.height : 0.0,
                maxHeight:
                    isMainAxisFixed ? designSize.height : double.infinity,
                minWidth: isCrossAxisFixed ? designSize.width : 0.0,
                maxWidth: isCrossAxisFixed ? designSize.width : maxChildCross,
              );

        final childSize = layoutChild(
          child,
          childConstraints,
        );

        childSizes[child] = childSize;

        if (!isCrossFixed) {
          final childCross = isHorizontal ? childSize.height : childSize.width;
          cross =
              math.max(cross, childCross + crossPaddingStart + crossPaddingEnd);
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
      final isMainAxisFixed = childParentData.isMainAxisFixed ?? true;
      final designSize = childParentData.designSize ?? Size.zero;
      final innerConstraints = isHorizontal
          ? BoxConstraints(
              minHeight: maxChildCross,
              maxHeight: maxChildCross,
              minWidth: isMainAxisFixed ? designSize.width : 0.0,
              maxWidth: isMainAxisFixed ? designSize.width : double.infinity,
            )
          : BoxConstraints(
              minHeight: isMainAxisFixed ? designSize.height : 0.0,
              maxHeight: isMainAxisFixed ? designSize.height : double.infinity,
              minWidth: maxChildCross,
              maxWidth: maxChildCross,
            );

      childSizes[child] = layoutChild(
        child,
        innerConstraints,
      );
    }

    // 2. we update children position along the main axis
    child = firstChild;
    var main = mainPaddingStart;
    while (child != null) {
      final childSize = childSizes[child]!;
      final childParentData = child.parentData as FigmaAutoData;
      final childCross = isHorizontal ? childSize.height : childSize.width;
      final childMain = isHorizontal ? childSize.width : childSize.height;

      double crossOffset;
      switch (childParentData.layoutAlign) {
        case figma.LayoutAlign.center:
          crossOffset = (cross / 2) - (childCross / 2);
          break;
        case figma.LayoutAlign.max:
          crossOffset = cross - crossPaddingEnd - childCross;
          break;
        default:
          crossOffset = crossPaddingStart;
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

    main += mainPaddingEnd;

    if (!isHorizontal) {
      return Size(
        cross,
        main.clamp(
          constraints.smallest.height,
          constraints.biggest.height,
        ),
      );
    } else {
      return Size(
        main.clamp(
          constraints.smallest.width,
          constraints.biggest.width,
        ),
        cross,
      );
    }
  }

  @override
  void performLayout() {
    size = _calculateLayout(
      layoutChild: (box, constraints) {
        box.layout(
          constraints,
          parentUsesSize: true,
        );
        return box.size;
      },
    );
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return _calculateLayout(
      layoutChild: (box, constraints) => box.getDryLayout(constraints),
    );
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
