import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/helpers/decorated.dart';
import 'package:figma_remote/src/converters/helpers/expanded.dart';
import 'package:figma_remote/src/converters/helpers/opacity.dart';
import 'package:figma_remote/src/converters/helpers/padding.dart';
import 'package:rfw/formats.dart';
import 'package:collection/collection.dart';

import 'node.dart';

BlobNode convert(figma.Frame node) {
  var result = () {
    switch (node.layoutMode) {
      case figma.LayoutMode.none:
        return _absoluteLayout(node);
      default:
        return _autoLayout(node);
    }
  }();

  result = wrapDecorated(
    node.fills,
    node.strokes,
    node.cornerRadius,
    node.rectangleCornerRadii,
    node.strokeWeight,
    result,
  )!;

  result = wrapOpacity(result, node.opacity);

  return result;
}

BlobNode _absoluteLayout(figma.Frame node) {
  // TODO
  return const ConstructorCall(
    'Stack',
    {},
  );
}

BlobNode _autoLayout(figma.Frame node) {
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
    switch (node.primaryAxisSizingMode) {
      case figma.PrimaryAxisSizingMode.auto:
        return 'min';
      case null:
      case figma.PrimaryAxisSizingMode.fixed:
        return 'max';
    }
  }();

  List<BlobNode>? children;

  if (node.children != null) {
    children = _children(
      node.children!,
      (a, b) => _autoChild(node.layoutMode, a, b),
    ).toList();

    /// Inserting sized boxes for spaces between items
    if (children.isNotEmpty &&
        node.itemSpacing != null &&
        node.itemSpacing! > 0) {
      children = children
          .map((c) => [
                ConstructorCall(
                  'SizedBox',
                  {
                    (node.layoutMode == figma.LayoutMode.vertical
                        ? 'height'
                        : 'width'): node.itemSpacing,
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

typedef ChildModifier = BlobNode Function(figma.Node node, BlobNode result);

List<BlobNode> _children(List<figma.Node?> children,
    [ChildModifier? modifier]) {
  return [
    ...children.whereNotNull().map(
      (x) {
        final blob = convertNode(x);
        return modifier != null && blob != null ? modifier(x, blob) : blob;
      },
    ).whereNotNull()
  ];
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
      if (layoutMode == figma.LayoutMode.vertical) {
        width = designSize?.x.toDouble();
      } else if (layoutMode == figma.LayoutMode.horizontal) {
        height = designSize?.y.toDouble();
      }
    }

    if (layoutGrow != null) {
      if (layoutGrow == 0) {
        if (layoutMode == figma.LayoutMode.vertical) {
          height = designSize?.y.toDouble();
        } else if (layoutMode == figma.LayoutMode.horizontal) {
          width = designSize?.x.toDouble();
        }
      }
    }
    result = ConstructorCall(
      'SizedBox',
      {
        if (height != null) 'height': height,
        if (width != null) 'width': width,
        'child': result,
      },
    );

    return result;
  }

  if (node is figma.Text) {
    return wrapExpanded(
      create(
        node.layoutAlign,
        node.size,
        node.layoutGrow,
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
      ),
      node.layoutGrow,
    );
  }
  if (node is figma.Frame) {
    return create(
      node.layoutAlign,
      node.size,
      null,
    );
  }

  return result;
}
