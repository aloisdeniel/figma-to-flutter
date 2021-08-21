import 'package:flutter/material.dart';
import 'package:figma/figma.dart' as figma;
import 'package:gap/gap.dart';

class FigmaAutoLayout extends StatelessWidget {
  const FigmaAutoLayout({
    Key? key,
    required this.designSize,
    this.layoutMode = figma.LayoutMode.vertical,
    this.counterAxisSizingMode = figma.CounterAxisSizingMode.auto,
    this.itemSpacing = 0,
    this.padding = EdgeInsets.zero,
    this.primaryAxisAlignItems = figma.PrimaryAxisAlignItems.min,
    this.counterAxisAlignItems = figma.CounterAxisAlignItems.min,
    this.children = const <Widget>[],
  })  : assert(layoutMode != figma.LayoutMode.none),
        super(
          key: key,
        );
  final List<Widget> children;
  final Size designSize;
  final figma.LayoutMode layoutMode;
  final figma.CounterAxisSizingMode counterAxisSizingMode;
  final figma.PrimaryAxisAlignItems primaryAxisAlignItems;
  final figma.CounterAxisAlignItems counterAxisAlignItems;
  final num itemSpacing;
  final EdgeInsets padding;

  static FigmaAutoConfiguration configOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FigmaAutoConfiguration>()!;
  }

  @override
  Widget build(BuildContext context) {
    final direction = () {
      switch (layoutMode) {
        case figma.LayoutMode.horizontal:
          return Axis.horizontal;
        default:
          return Axis.vertical;
      }
    }();

    final crossAxisAlignment = () {
      switch (counterAxisAlignItems) {
        case figma.CounterAxisAlignItems.min:
          return CrossAxisAlignment.start;
        case figma.CounterAxisAlignItems.max:
          return CrossAxisAlignment.end;
        case figma.CounterAxisAlignItems.center:
          return CrossAxisAlignment.center;
      }
    }();
    final mainAxisAlignment = () {
      switch (primaryAxisAlignItems) {
        case figma.PrimaryAxisAlignItems.min:
          return MainAxisAlignment.start;
        case figma.PrimaryAxisAlignItems.center:
          return MainAxisAlignment.center;
        case figma.PrimaryAxisAlignItems.max:
          return MainAxisAlignment.end;
        case figma.PrimaryAxisAlignItems.spaceBetween:
          return MainAxisAlignment.spaceAround;
      }
    }();
    return FigmaAutoConfiguration(
      counterAxisAlignItems: counterAxisAlignItems,
      counterAxisSizingMode: counterAxisSizingMode,
      layoutMode: layoutMode,
      primaryAxisAlignItems: primaryAxisAlignItems,
      child: Padding(
        padding: padding,
        child: Flex(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          direction: direction,
          children: itemSpacing == 0 || children.isEmpty
              ? children
              : [
                  children.first,
                  ...children
                      .skip(1)
                      .map((child) => [
                            Gap(itemSpacing.toDouble()),
                            child,
                          ])
                      .expand((x) => x)
                ],
        ),
      ),
    );
  }
}

class FigmaAutoConfiguration extends InheritedWidget {
  const FigmaAutoConfiguration({
    Key? key,
    required Widget child,
    required this.layoutMode,
    required this.counterAxisAlignItems,
    required this.primaryAxisAlignItems,
    required this.counterAxisSizingMode,
  }) : super(
          key: key,
          child: child,
        );

  final figma.LayoutMode layoutMode;
  final figma.CounterAxisSizingMode counterAxisSizingMode;
  final figma.PrimaryAxisAlignItems primaryAxisAlignItems;
  final figma.CounterAxisAlignItems counterAxisAlignItems;

  @override
  bool updateShouldNotify(covariant FigmaAutoConfiguration oldWidget) {
    return layoutMode != oldWidget.layoutMode ||
        counterAxisSizingMode != oldWidget.counterAxisSizingMode ||
        primaryAxisAlignItems != oldWidget.primaryAxisAlignItems ||
        counterAxisAlignItems != oldWidget.counterAxisAlignItems;
  }
}

class FigmaAuto extends StatelessWidget {
  const FigmaAuto({
    Key? key,
    required this.layoutAlign,
    this.designSize,
    this.isMainAxisFixed,
    this.isCrossAxisFixed,
    required this.child,
  }) : super(key: key);

  final figma.LayoutAlign layoutAlign;
  final Size? designSize;
  final bool? isMainAxisFixed;
  final bool? isCrossAxisFixed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var child = this.child;
    double width = designSize?.width ?? 0;
    double height = designSize?.height ?? 0;

    if (layoutAlign == figma.LayoutAlign.stretch) {
      final auto = FigmaAutoLayout.configOf(context);
      if (auto.layoutMode == figma.LayoutMode.vertical) {
        width = double.infinity;
      } else if (auto.layoutMode == figma.LayoutMode.horizontal) {
        height = double.infinity;
      }
    }
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
