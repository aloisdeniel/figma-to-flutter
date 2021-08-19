import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/rendering/layouts/rotated.dart';

class FigmaRotated extends SingleChildRenderObjectWidget {
  const FigmaRotated({
    Key? key,
    required this.transform,
    required Widget child,
  }) : super(key: key, child: child);

  final List<List<num>> transform;

  @override
  RenderFigmaRotated createRenderObject(BuildContext context) =>
      RenderFigmaRotated(transform: transform);

  @override
  void updateRenderObject(
      BuildContext context, RenderFigmaRotated renderObject) {
    renderObject.transform = transform;
  }
}
