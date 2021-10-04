import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/adaptative/adaptative_size_builder.dart';
import 'package:flutter_figma_app/adaptative/data.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/spacing.dart';

class AppAdaptativeWindow extends StatelessWidget {
  const AppAdaptativeWindow({
    Key? key,
    this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final ValueWidgetBuilder<AppAdaptativeSize>? builder;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return AppAdaptativeSizeBuilder(
      builder: (context, size, _) {
        final child = this.child ?? builder!.call(context, size, _);
        final result = Material(
          color: theme.color.background2,
          child: AppPadding.big(
            child: child,
          ),
        );
        switch (size) {
          case AppAdaptativeSize.small:
            return result;
          default:
            return Container(
              color: theme.color.background1,
              alignment: Alignment.center,
              child: SizedBox(
                width: 480,
                child: Card(
                  elevation: 10,
                  child: result,
                ),
              ),
            );
        }
      },
    );
  }
}
