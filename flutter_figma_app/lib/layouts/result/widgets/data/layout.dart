import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/layouts/result/widgets/dart_code/layout.dart';
import 'package:flutter_figma_app/state/result.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/highlight.dart';
import 'package:flutter_figma_app/widgets/spacing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataPreview extends ConsumerWidget {
  const DataPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final selectedComponent = ref.watch(selectedComponentProvider);

    if (selectedComponent == null || selectedComponent is FigmaComponentSet) {
      return const Center(
        child: Text('No component selected'),
      );
    }

    final initialData = () {
      if (selectedComponent is FigmaComponent) {
        return selectedComponent.defaultData;
      }
      if (selectedComponent is FigmaComponentVariant) {
        return selectedComponent.defaultData;
      }

      return null;
    }();

    const encoder = JsonEncoder.withIndent('   ');

    return AppPadding.regular(
      child: SingleChildScrollView(
        primary: true,
        child: SelectableHighlightView(
          initialData == null ? '' : encoder.convert(initialData),
          language: 'json',
          tabSize: 4,
          theme: createCodeTheme(theme),
          padding: theme.edgeInsets.regular,
          textStyle: theme.textStyle.code1,
        ),
      ),
    );
  }
}
