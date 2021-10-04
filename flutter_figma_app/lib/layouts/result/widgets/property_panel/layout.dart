import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/state/result.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/async_layout.dart';
import 'package:flutter_figma_app/widgets/bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class PropertyPanel extends ConsumerWidget {
  const PropertyPanel({
    Key? key,
    required this.selectedTab,
  }) : super(key: key);

  final int selectedTab;

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
              children: [
                Spacer(),
              ],
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverStickyHeader(
                    header: const SectionHeader(
                      title: 'Global',
                      border: false,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        const SizedBox(
                          height: 24,
                        ),
                      ]),
                    ),
                  ),
                  SliverStickyHeader(
                    header: const SectionHeader(
                      title: 'Theme',
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        const SizedBox(
                          height: 24,
                        ),
                      ]),
                    ),
                  ),
                  SliverStickyHeader(
                    header: const SectionHeader(
                      title: 'Data',
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        const SizedBox(
                          height: 24,
                        ),
                      ]),
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
                style: theme.textStyle.title3.copyWith(
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
