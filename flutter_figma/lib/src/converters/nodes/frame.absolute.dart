part of 'frame.dart';

BlobNode _absoluteLayout(FigmaComponentContext context, figma.Frame node) {
  List<BlobNode>? children;
  final layoutSize = node.size ?? figma.Vector2D(x: 0, y: 0);
  if (node.children != null) {
    children = _children(
      context,
      node.children!,
      (a, b) => _constrainedChild(
        a,
        layoutSize,
        b,
      ),
    ).toList();
  }

  var result = ConstructorCall(
    'Stack',
    {
      'clipBehavior': node.clipsContent ?? false ? 'hardEdge' : 'none',
      if (node.children != null) 'children': children,
    },
  );

  return result;
}

BlobNode _constrainedChild(
  figma.Node node,
  figma.Vector2D layoutDesignSize,
  BlobNode result,
) {
  final size = node.designSize();
  final position = node.designPosition();
  final constraints = _constraints(node);

  if (constraints?.horizontal != figma.HorizontalConstraint.leftRight ||
      constraints?.vertical != figma.VerticalConstraint.topBottom) {
    result = ConstructorCall(
      'SizedBox',
      {
        if (constraints?.horizontal != figma.HorizontalConstraint.leftRight)
          'width': size.width,
        if (constraints?.vertical != figma.VerticalConstraint.topBottom)
          'height': size.height,
        'child': result,
      },
    );
  }
  // TODO Scale / Center constraints
  result = ConstructorCall(
    'Positioned',
    {
      ...() {
        switch (constraints?.horizontal) {
          case figma.HorizontalConstraint.scale:
          case figma.HorizontalConstraint.leftRight:
            return {
              'start': position.dx,
              'end': layoutDesignSize.x - position.dx - size.width,
            };
          case figma.HorizontalConstraint.right:
            return {
              'end': layoutDesignSize.x - position.dx - size.width,
            };
          case figma.HorizontalConstraint.left:
            return {
              'start': position.dx,
            };
          default:
            return {};
        }
      }(),
      ...() {
        switch (constraints?.vertical) {
          case figma.VerticalConstraint.scale:
          case figma.VerticalConstraint.topBottom:
            return {
              'top': position.dy,
              'bottom': layoutDesignSize.y - position.dy - size.height,
            };
          case figma.VerticalConstraint.bottom:
            return {
              'bottom': layoutDesignSize.y - position.dy - size.height,
            };
          case figma.VerticalConstraint.top:
            return {
              'top': position.dy,
            };
          default:
            return {};
        }
      }(),
      'child': result,
    },
  );

  return result;
}

figma.LayoutConstraint? _constraints(figma.Node node) {
  if (node is figma.Text) {
    return node.constraints;
  }
  if (node is figma.Rectangle) {
    return node.constraints;
  }
  if (node is figma.Vector) {
    return node.constraints;
  }
  if (node is figma.Frame) {
    return node.constraints;
  }

  return null;
}
