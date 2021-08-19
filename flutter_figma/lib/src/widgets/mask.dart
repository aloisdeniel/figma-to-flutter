import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/rendering/shape.dart';
import '../helpers/api_extensions.dart';

class FigmaMask extends StatelessWidget {
  final FigmaShape? shape;
  final Widget child;
  const FigmaMask({
    Key? key,
    this.shape,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shape = this.shape;
    if (shape == null) {
      return child;
    }
    if (shape is FigmaRectangleShape) {
      final rectangleCornerRadii = shape.rectangleCornerRadii.toBorderRadius();
      return ClipRRect(
        borderRadius: rectangleCornerRadii,
        child: child,
      );
    }

    if (shape is FigmaPathShape) {
      return ClipPath(
        clipper: _Clipper(shape),
        child: child,
      );
    }

    return child;
  }
}

class _Clipper extends CustomClipper<Path> {
  final FigmaPathShape shape;

  const _Clipper(this.shape);

  @override
  Path getClip(Size size) {
    final clipPath = Path();
    if (shape.fillGeometry != null) {
      for (var geometry in shape.fillGeometry!) {
        final bounds = geometry.getBounds();
        final transform = (Matrix4.identity()
          ..scale(
            size.width / (bounds.left + bounds.width),
            size.height / (bounds.top + bounds.height),
          ));
        clipPath.addPath(geometry.transform(transform.storage), Offset.zero);
      }
    }
    return clipPath;
  }

  @override
  bool shouldReclip(_Clipper oldClipper) {
    return oldClipper.shape != shape;
  }
}
