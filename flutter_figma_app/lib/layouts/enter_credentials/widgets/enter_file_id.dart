import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/state/figma.dart';
import 'package:flutter_figma_app/widgets/button.dart';
import 'package:flutter_figma_app/widgets/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnterFileId extends ConsumerWidget {
  const EnterFileId({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileId = ref.watch(figma.fileId.value);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        fileId.map(
          data: (data) => AppTextField(
            initialText: data.value ?? '',
            onChanged: (v) => ref.read(figma.fileId.value.notifier).update(v),
            hintText: 'File Identifier',
          ),
          loading: (loading) => const SizedBox(),
          error: (error) => Text(
            error.toString(),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: AppTextButton(
            onTap: () {},
            title: 'Where to find the document identifier?',
          ),
        ),
      ],
    );
  }
}
