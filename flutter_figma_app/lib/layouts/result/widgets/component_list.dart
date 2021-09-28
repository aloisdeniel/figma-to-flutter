import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/state/result.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/async_layout.dart';
import 'package:flutter_figma_app/widgets/bar.dart';
import 'package:flutter_figma_app/widgets/icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultComponentList extends ConsumerWidget {
  const ResultComponentList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final library = ref.watch(remoteLibraryProvider);
    final selectedComponent = ref.watch(selectedComponentProvider);
    return Material(
      color: theme.color.background1,
      child: AsyncLayout<FigmaRemoteLibrary?>(
        value: library,
        builder: (context, library, _) => Column(
          children: [
            MenuBar(
              children: [],
            ),
            Expanded(
              child: ListView(
                children: [
                  if (library?.componentSets != null)
                    ...library!.componentSets.map(
                      (e) {
                        final sectionSelection =
                            e.variants.any((v) => v == selectedComponent)
                                ? SelectedMode.secondary
                                : SelectedMode.none;
                        return [
                          ComponentTile(
                            component: e,
                            isSelected: sectionSelection,
                          ),
                          ...e.variants.map(
                            (v) => ComponentTile(
                              component: v,
                              isSelected: v == selectedComponent
                                  ? SelectedMode.main
                                  : sectionSelection,
                            ),
                          )
                        ];
                      },
                    ).expand((e) => e),
                  if (library?.components != null)
                    ...library!.components.map(
                      (e) => ComponentTile(
                        component: e,
                        isSelected: e == selectedComponent
                            ? SelectedMode.main
                            : SelectedMode.none,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum SelectedMode {
  main,
  secondary,
  none,
}

class ComponentTile extends ConsumerWidget {
  const ComponentTile({
    Key? key,
    required this.isSelected,
    required this.component,
  }) : super(key: key);

  final SelectedMode isSelected;
  final FigmaComponentBase component;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final color = () {
      switch (isSelected) {
        case SelectedMode.main:
          return theme.color.primary1.withOpacity(0.12);
        case SelectedMode.secondary:
          return theme.color.primary1.withOpacity(0.06);
        default:
          return Colors.transparent;
      }
    }();
    final foreground = () {
      switch (isSelected) {
        case SelectedMode.main:
          return theme.color.primary1;
        default:
          return theme.color.foreground1;
      }
    }();
    return Container(
      color: color,
      child: ListTile(
        title: Row(
          children: [
            if (component is FigmaComponentVariant) const SizedBox(width: 12),
            AppIcon(
              component is FigmaComponentSet
                  ? (isSelected == SelectedMode.secondary
                      ? AppIcons.componentSetSelected
                      : AppIcons.componentSetNotSelected)
                  : (isSelected == SelectedMode.main
                      ? AppIcons.componentSelected
                      : AppIcons.componentNotSelected),
              color: foreground,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                component.figmaName,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: theme.textStyle.body1.copyWith(
                  color: foreground,
                  fontWeight: isSelected == SelectedMode.main
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        onTap: component is FigmaComponentSet
            ? null
            : () {
                ref.watch(selectedComponentProvider.notifier).state = component;
              },
      ),
    );
  }
}
