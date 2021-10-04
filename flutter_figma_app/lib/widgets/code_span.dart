import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';

class CodeSpan extends StatelessWidget {
  const CodeSpan(
    this.code, {
    Key? key,
  }) : super(key: key);

  final String code;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.color.background3,
        borderRadius: theme.borderRadius.regular,
      ),
      padding: theme.edgeInsets.small.copyWith(
        top: theme.edgeInsets.small.top / 2,
        bottom: theme.edgeInsets.small.top / 2,
      ),
      child: SelectableText(
        code,
        style: theme.textStyle.code1.copyWith(
          color: theme.color.foreground1,
        ),
      ),
    );
  }
}
