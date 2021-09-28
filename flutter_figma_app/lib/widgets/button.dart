import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      onPressed: onTap,
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: theme.textStyle.title3,
      ),
    );
  }
}
