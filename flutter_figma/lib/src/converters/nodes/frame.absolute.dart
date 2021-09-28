part of 'frame.dart';

BlobNode _absoluteLayout(FigmaComponentContext context, figma.Frame node) {
  List<BlobNode>? children;
  final layoutSize = node.size ?? figma.Vector2D(x: 0, y: 0);
  if (node.children != null) {
    children = _children(
      context,
      node.children!,
      (a, b) => _constrainedChild(
        context,
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
  FigmaComponentContext context,
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
            final start = position.dx;
            final end = layoutDesignSize.x - position.dx - size.width;
            final startName = context.theme.spacing.create(
              start,
              node.name ?? 'pos',
            );
            final endName = context.theme.spacing.create(
              end,
              node.name ?? 'pos',
            );
            return {
              'start': StateReference(['theme', 'spacing', startName]),
              'end': StateReference(['theme', 'spacing', endName]),
            };
          case figma.HorizontalConstraint.right:
            final end = layoutDesignSize.x - position.dx - size.width;
            final endName = context.theme.spacing.create(
              end,
              node.name ?? 'pos',
            );
            return {
              'end': StateReference(['theme', 'spacing', endName]),
            };
          case figma.HorizontalConstraint.left:
            final start = position.dx;
            final startName = context.theme.spacing.create(
              start,
              node.name ?? 'pos',
            );
            return {
              'start': StateReference(['theme', 'spacing', startName]),
            };
          default:
            return {};
        }
      }(),
      ...() {
        switch (constraints?.vertical) {
          case figma.VerticalConstraint.scale:
          case figma.VerticalConstraint.topBottom:
            final top = position.dy;
            final bottom = layoutDesignSize.y - position.dy - size.height;
            final topName = context.theme.spacing.create(
              top,
              node.name ?? 'pos',
            );
            final bottomName = context.theme.spacing.create(
              bottom,
              node.name ?? 'pos',
            );
            return {
              'top': StateReference(['theme', 'spacing', topName]),
              'bottom': StateReference(['theme', 'spacing', bottomName]),
            };
          case figma.VerticalConstraint.bottom:
            final bottom = layoutDesignSize.y - position.dy - size.height;
            final bottomName = context.theme.spacing.create(
              bottom,
              node.name ?? 'pos',
            );
            return {
              'bottom': StateReference(['theme', 'spacing', bottomName]),
            };
          case figma.VerticalConstraint.top:
            final top = position.dy;
            final topName = context.theme.spacing.create(
              top,
              node.name ?? 'pos',
            );
            return {
              'top': StateReference(['theme', 'spacing', topName]),
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
