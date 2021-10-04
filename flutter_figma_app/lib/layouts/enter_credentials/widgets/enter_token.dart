import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/state/figma.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/button.dart';
import 'package:flutter_figma_app/widgets/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnterToken extends ConsumerWidget {
  const EnterToken({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final fileId = ref.watch(figma.apiToken.value);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        fileId.map(
          data: (data) => AppTextField(
            obscureText: true,
            initialText: data.value ?? '',
            onChanged: (v) => ref.read(figma.apiToken.value.notifier).update(v),
            hintText: 'Figma API Token',
          ),
          loading: (loading) => const SizedBox(),
          error: (error) => Text(
            error.toString(),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: AppTextButton(
            title: 'How to get a Figma API Token?',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
