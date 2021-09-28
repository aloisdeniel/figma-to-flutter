import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/spacing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/form.dart';

class EnterCredentialsLayout extends ConsumerWidget {
  const EnterCredentialsLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Material(
      child: WindowContainer(
        child: CredentialsForm(),
      ),
    );
  }
}

class WindowContainer extends StatelessWidget {
  const WindowContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      color: theme.color.background1,
      alignment: Alignment.center,
      child: SizedBox(
        width: 480,
        child: Card(
          elevation: 10,
          child: Material(
            color: theme.color.background2,
            child: AppPadding.big(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
