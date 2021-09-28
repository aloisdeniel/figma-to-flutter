part of 'frame.dart';

BlobNode _autoLayout(FigmaComponentContext context, figma.Frame node) {
  final direction = () {
    switch (node.layoutMode) {
      case figma.LayoutMode.horizontal:
        return 'Row';
      default:
        return 'Column';
    }
  }();

  final crossAxisAlignment = () {
    switch (node.counterAxisAlignItems) {
      case null:
      case figma.CounterAxisAlignItems.min:
        return 'start';
      case figma.CounterAxisAlignItems.max:
        return 'end';
      case figma.CounterAxisAlignItems.center:
        return 'center';
    }
  }();
  final mainAxisAlignment = () {
    switch (node.primaryAxisAlignItems) {
      case null:
      case figma.PrimaryAxisAlignItems.min:
        return 'start';
      case figma.PrimaryAxisAlignItems.center:
        return 'center';
      case figma.PrimaryAxisAlignItems.max:
        return 'end';
      case figma.PrimaryAxisAlignItems.spaceBetween:
        return 'spaceAround';
    }
  }();

  final mainAxisSize = () {
    if (node.layoutGrow != null && node.layoutGrow! >= 1) return 'max';
    switch (node.primaryAxisSizingMode) {
      case null:
      case figma.PrimaryAxisSizingMode.auto:
        return 'min';
      case figma.PrimaryAxisSizingMode.fixed:
        return 'max';
    }
  }();

  List<BlobNode>? children;

  if (node.children != null) {
    children = _children(
      context,
      node.children!,
      (a, b) => _autoChild(node.layoutMode, a, b),
    ).toList();

    /// Inserting sized boxes for spaces between items
    final itemSpacing = node.itemSpacing;
    if (children.isNotEmpty && itemSpacing != null && itemSpacing > 0) {
      final refName = context.theme.spacing
          .create(itemSpacing, '${node.name}SpaceBetween'.asFieldName());
      children = children
          .map((c) => [
                ConstructorCall(
                  'SizedBox',
                  {
                    (node.layoutMode == figma.LayoutMode.vertical
                            ? 'height'
                            : 'width'):
                        StateReference(['theme', 'spacing', refName]),
                  },
                ),
                c,
              ])
          .expand((x) => x)
          .skip(1)
          .toList();
    }
  }

  BlobNode result = ConstructorCall(
    direction,
    {
      'mainAxisSize': mainAxisSize,
      'mainAxisAlignment': mainAxisAlignment,
      'crossAxisAlignment': crossAxisAlignment,
      if (node.children != null) 'children': children,
    },
  );

  result = wrapPadding(
    context,
    node.name ?? 'frame',
    result,
    node.paddingLeft,
    node.paddingTop,
    node.paddingRight,
    node.paddingBottom,
  );

  double? height, width;
  if (node.primaryAxisSizingMode == figma.PrimaryAxisSizingMode.fixed) {
    if (node.layoutMode == figma.LayoutMode.vertical) {
      height = node.size?.y.toDouble();
    } else if (node.layoutMode == figma.LayoutMode.horizontal) {
      width = node.size?.x.toDouble();
    }
  }

  if (node.counterAxisSizingMode == figma.CounterAxisSizingMode.fixed) {
    if (node.layoutMode == figma.LayoutMode.vertical) {
      width = node.size?.x.toDouble();
    } else if (node.layoutMode == figma.LayoutMode.horizontal) {
      height = node.size?.y.toDouble();
    }
  }

  if (width != null || height != null) {
    result = ConstructorCall(
      'SizedBox',
      {
        if (height != null) 'height': height,
        if (width != null) 'width': width,
        'child': result,
      },
    );
  }

  return result;
}

BlobNode _autoChild(
  figma.LayoutMode? layoutMode,
  figma.Node node,
  BlobNode result,
) {
  BlobNode create(
    figma.LayoutAlign? layoutAlign,
    figma.Vector2D? designSize,
    double? layoutGrow,
    bool horizontalHug,
    bool verticalHug,
  ) {
    double? width, height;
    if (layoutAlign == null) {
      return result;
    }
    if (layoutAlign == figma.LayoutAlign.stretch) {
      if (layoutMode == figma.LayoutMode.vertical) {
        width = double.infinity;
      } else if (layoutMode == figma.LayoutMode.horizontal) {
        height = double.infinity;
      }
    } else {
      if (layoutMode == figma.LayoutMode.vertical && !horizontalHug) {
        width = designSize?.x.toDouble();
      } else if (layoutMode == figma.LayoutMode.horizontal && !verticalHug) {
        height = designSize?.y.toDouble();
      }
    }

    if (layoutGrow == null || layoutGrow < 1.0) {
      if (layoutMode == figma.LayoutMode.vertical && !verticalHug) {
        height = designSize?.y.toDouble();
      } else if (layoutMode == figma.LayoutMode.horizontal && !horizontalHug) {
        width = designSize?.x.toDouble();
      }
    } else if (layoutGrow >= 1.0) {
      if (layoutMode == figma.LayoutMode.vertical && !verticalHug) {
        height = double.infinity;
      } else if (layoutMode == figma.LayoutMode.horizontal && !horizontalHug) {
        width = double.infinity;
      }
    }

    if (width != null || height != null) {
      result = ConstructorCall(
        'SizedBox',
        {
          if (width != null) 'width': width,
          if (height != null) 'height': height,
          'child': result,
        },
      );
    }

    return result;
  }

  if (node is figma.Text) {
    return wrapExpanded(
      create(
        node.layoutAlign,
        node.size,
        node.layoutGrow,
        node.style?.textAutoResize == figma.TextAutoResize.widthAndHeight,
        node.style?.textAutoResize != figma.TextAutoResize.none,
      ),
      node.layoutGrow,
    );
  }
  if (node is figma.Rectangle) {
    return wrapExpanded(
      create(
        node.layoutAlign,
        node.size,
        node.layoutGrow,
        false,
        false,
      ),
      node.layoutGrow,
    );
  }
  if (node is figma.Vector) {
    return wrapExpanded(
      create(
        node.layoutAlign,
        node.size,
        node.layoutGrow,
        false,
        false,
      ),
      node.layoutGrow,
    );
  }
  if (node is figma.Frame) {
    return wrapExpanded(
      create(
        node.layoutAlign,
        node.size,
        null,
        node.primaryAxisSizingMode == figma.PrimaryAxisSizingMode.auto,
        node.counterAxisSizingMode == figma.CounterAxisSizingMode.auto,
      ),
      node.layoutGrow,
    );
  }

  return result;
}
