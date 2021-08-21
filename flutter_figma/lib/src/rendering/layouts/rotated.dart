import 'dart:math' as math;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';

class RenderFigmaRotated extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  RenderFigmaRotated({
    required List<List<num>> transform,
    RenderBox? child,
  }) : _transform = transform {
    this.child = child;
  }

  List<List<num>> get transform => _transform;
  List<List<num>> _transform;
  set transform(List<List<num>> value) {
    if (_transform == value) return;
    _transform = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final child = this.child;
    if (child == null) return 0.0;
    return math.min(
      child.getMinIntrinsicHeight(height),
      child.getMinIntrinsicWidth(height),
    );
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    final child = this.child;
    if (child == null) return 0.0;
    return math.max(
      child.getMaxIntrinsicHeight(height),
      child.getMaxIntrinsicWidth(height),
    );
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final child = this.child;
    if (child == null) return 0.0;
    return math.min(
      child.getMinIntrinsicHeight(width),
      child.getMinIntrinsicWidth(width),
    );
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final child = this.child;
    if (child == null) return 0.0;
    return math.max(
      child.getMaxIntrinsicHeight(width),
      child.getMaxIntrinsicWidth(width),
    );
  }

  Matrix4? _paintTransform;

  Matrix4 _calculateTransform(Size childSize) => Matrix4.identity()
        //..translate(childSize.width, childSize.height)
        ..rotateZ(_transform.rotation)
      //..translate(-childSize.width / 2.0, -childSize.height / 2.0);
      ;

  @override
  void performLayout() {
    _paintTransform = null;
    final child = this.child;
    if (child != null) {
      child.layout(
        constraints,
        parentUsesSize: true,
      );
      _paintTransform = _calculateTransform(child.size);
      final rect = Path()
        ..addRect(Offset.zero & child.size)
        ..transform(_paintTransform!.storage);
      size = rect.getBounds().size;
    } else {
      performResize();
    }
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final child = this.child;
    if (child == null) {
      return constraints.smallest;
    }

    final childSize = child.getDryLayout(constraints);
    final dryTransform = _calculateTransform(childSize);
    final rect = Path()
      ..addRect(Offset.zero & childSize)
      ..transform(dryTransform.storage);
    return rect.getBounds().size;
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final child = this.child;
    assert(_paintTransform != null || debugNeedsLayout || child == null);
    if (child == null || _paintTransform == null) return false;
    return result.addWithPaintTransform(
      transform: _paintTransform,
      position: position,
      hitTest: (BoxHitTestResult result, Offset position) {
        return child.hitTest(result, position: position);
      },
    );
  }

  void _paintChild(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final child = this.child;
    final transform = this._paintTransform;
    if (child != null) {
      if (transform != null) {
        context.pushTransform(
          needsCompositing,
          offset,
          transform,
          _paintChild,
        );
      } else {
        _paintChild(context, Offset.zero);
      }
    }
  }

  @override
  void applyPaintTransform(RenderBox child, Matrix4 transform) {
    if (_paintTransform != null) transform.multiply(_paintTransform!);
    super.applyPaintTransform(child, transform);
  }
}
