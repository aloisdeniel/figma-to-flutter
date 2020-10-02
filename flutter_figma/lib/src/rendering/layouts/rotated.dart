import 'dart:math' as math;
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';

class RenderFigmaRotated extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  RenderFigmaRotated({
    @required List<List<num>> transform,
    RenderBox child,
  })  : assert(transform != null),
        _transform = transform {
    this.child = child;
  }

  /// The number of clockwise quarter turns the child should be rotated.
  List<List<num>> get transform => _transform;
  List<List<num>> _transform;
  set transform(List<List<num>> value) {
    assert(value != null);
    if (_transform == value) return;
    _transform = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child == null) return 0.0;
    return math.min(
      child.getMinIntrinsicHeight(height),
      child.getMinIntrinsicWidth(height),
    );
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child == null) return 0.0;
    return math.max(
      child.getMaxIntrinsicHeight(height),
      child.getMaxIntrinsicWidth(height),
    );
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child == null) return 0.0;
    return math.min(
      child.getMinIntrinsicHeight(width),
      child.getMinIntrinsicWidth(width),
    );
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child == null) return 0.0;
    return math.max(
      child.getMaxIntrinsicHeight(width),
      child.getMaxIntrinsicWidth(width),
    );
  }

  Matrix4 _paintTransform;

  @override
  void performLayout() {
    _paintTransform = null;
    if (child != null) {
      child.layout(
        constraints,
        parentUsesSize: true,
      );
      _paintTransform = Matrix4.identity()
        ..translate(child.size.width / 2.0, child.size.height / 2.0)
        ..rotateZ(_transform.rotation)
        ..translate(-child.size.width / 2.0, -child.size.height / 2.0);
      final rect = Path()..addRect(Offset.zero & child.size);
      rect.transform(_paintTransform.storage);
      size = rect.getBounds().size;
    } else {
      performResize();
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
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
    context.paintChild(child, offset);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null)
      context.pushTransform(
          needsCompositing, offset, _paintTransform, _paintChild);
  }

  @override
  void applyPaintTransform(RenderBox child, Matrix4 transform) {
    if (_paintTransform != null) transform.multiply(_paintTransform);
    super.applyPaintTransform(child, transform);
  }
}
