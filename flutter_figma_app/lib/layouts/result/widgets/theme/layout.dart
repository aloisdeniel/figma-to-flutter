import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/helpers/map_key.dart';
import 'package:flutter_figma_app/layouts/result/widgets/theme/widgets/spacing.dart';
import 'package:flutter_figma_app/layouts/result/widgets/theme/widgets/text.dart';
import 'package:flutter_figma_app/state/result.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

import 'widgets/color.dart';

class SelectedComponentThemePreview extends ConsumerWidget {
  const SelectedComponentThemePreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedComponent = ref.watch(selectedComponentProvider);
    final initialTheme = () {
      if (selectedComponent is FigmaComponent) {
        return selectedComponent.declaration.initialState?['theme']
            as Map<String, Object?>?;
      }
      if (selectedComponent is FigmaComponentVariant) {
        return selectedComponent.declaration.initialState?['theme']
            as Map<String, Object?>?;
      }

      return null;
    }();
    return ThemePreview(
      theme: initialTheme ?? {},
    );
  }
}

class ThemePreview extends StatelessWidget {
  const ThemePreview({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final Map<String, Object?> theme;

  Map<int, Set<String>> _colors() {
    final map = theme['color'] as Map<String, Object?>?;
    if (map == null || map.isEmpty) {
      return const <int, Set<String>>{};
    }
    final result = <int, Set<String>>{};

    for (var item in map.entries) {
      final value = item.value;
      if (value is num) {
        final color = value.toInt();
        final colorEntry = result.putIfAbsent(color, () => <String>{});
        colorEntry.add(item.key);
      }
    }

    return result;
  }

  Map<int, Set<String>> _spacing() {
    final map = theme['spacing'] as Map<String, Object?>?;
    if (map == null || map.isEmpty) {
      return const <int, Set<String>>{};
    }
    final result = <int, Set<String>>{};

    for (var item in map.entries) {
      final value = item.value;
      if (value is num) {
        final color = value.toInt();
        final colorEntry = result.putIfAbsent(color, () => <String>{});
        colorEntry.add(item.key);
      }
    }

    return result;
  }

  Map<MapKey<String?, Object?>, Set<String>> _textStyles() {
    final map = theme['textStyles'] as Map<String, Object?>?;
    if (map == null || map.isEmpty) {
      return const <MapKey<String?, Object?>, Set<String>>{};
    }
    final result = <MapKey<String?, Object?>, Set<String>>{};

    for (var item in map.entries) {
      final value = item.value;
      if (value is Map<String, Object?>) {
        final colorEntry = result.putIfAbsent(
          MapKey({...value}..remove('color')),
          () => <String>{},
        );
        colorEntry.add(item.key);
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final colors = _colors();
    final textStyles = _textStyles();
    final spacing = _spacing();
    return ListView(
      children: [
        if (colors.isNotEmpty) ...[
          const SectionHeader(
            title: 'Colors',
          ),
          ...colors.entries
              .map(
                (x) => ColorPreviewTile(
                  names: x.value.toList(),
                  value: x.key,
                ),
              )
              .sortedBy((x) => x.value),
        ],
        if (textStyles.isNotEmpty) ...[
          const SectionHeader(
            title: 'Text',
          ),
          ...textStyles.entries
              .map(
                (x) => TextStylePreviewTile(
                  names: x.value.toList(),
                  value: x.key.map,
                ),
              )
              .sortedBy((x) => (x.value as Map)['fontSize'] as num),
        ],
        if (textStyles.isNotEmpty) ...[
          const SectionHeader(
            title: 'Spacing',
          ),
          ...spacing.entries
              .map(
                (x) => SpacingTile(
                  names: x.value.toList(),
                  value: x.key,
                ),
              )
              .sortedBy((x) => x.value),
        ],
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
    this.border = true,
  }) : super(key: key);

  final String title;
  final bool border;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      margin: theme.edgeInsets.big.copyWith(bottom: 0, left: 0, right: 0),
      decoration: BoxDecoration(
        border: border
            ? Border(
                top: BorderSide(
                color: theme.color.background3,
                width: 1,
              ))
            : null,
      ),
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: theme.textStyle.title2.copyWith(
                  color: theme.color.foreground1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
