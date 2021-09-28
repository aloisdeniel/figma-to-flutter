import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:gap/gap.dart';

enum GapSize { small, regular, big }

class AppGap extends StatelessWidget {
  const AppGap.small({
    Key? key,
  })  : size = GapSize.small,
        super(key: key);
  const AppGap.regular({
    Key? key,
  })  : size = GapSize.regular,
        super(key: key);
  const AppGap.big({
    Key? key,
  })  : size = GapSize.big,
        super(key: key);

  final GapSize size;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Gap(() {
      switch (size) {
        case GapSize.small:
          return theme.edgeInsets.small.left;
        case GapSize.regular:
          return theme.edgeInsets.regular.left;
        case GapSize.big:
          return theme.edgeInsets.big.left;
      }
    }());
  }
}

class AppPadding extends StatelessWidget {
  const AppPadding.small({
    Key? key,
    required this.child,
  })  : size = GapSize.small,
        super(key: key);
  const AppPadding.regular({
    Key? key,
    required this.child,
  })  : size = GapSize.regular,
        super(key: key);
  const AppPadding.big({
    Key? key,
    required this.child,
  })  : size = GapSize.big,
        super(key: key);

  final GapSize size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: () {
        switch (size) {
          case GapSize.small:
            return theme.edgeInsets.small;
          case GapSize.regular:
            return theme.edgeInsets.regular;
          case GapSize.big:
            return theme.edgeInsets.big;
        }
      }(),
      child: child,
    );
  }
}
