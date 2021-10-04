import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/adaptative/adaptative.dart';

import 'data.dart';

class AppAdaptativeSizeBuilder extends StatelessWidget {
  const AppAdaptativeSizeBuilder({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);
  final Widget? child;
  final ValueWidgetBuilder<AppAdaptativeSize> builder;

  @override
  Widget build(BuildContext context) {
    final adaptative = AppAdaptative.of(context);
    return builder(
      context,
      adaptative.size,
      child,
    );
  }
}
