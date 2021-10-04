import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.initialText,
    required this.onChanged,
    this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  final String initialText;
  final String? hintText;
  final bool obscureText;
  final ValueChanged<String> onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final controller = TextEditingController(text: widget.initialText);
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return TextField(
      controller: controller,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      style: theme.textStyle.code1,
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: theme.textStyle.body1,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
