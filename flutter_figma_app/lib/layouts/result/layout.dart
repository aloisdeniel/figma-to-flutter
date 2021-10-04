import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/layouts/result/widgets/library_loader.dart';
import 'package:flutter_figma_app/layouts/result/widgets/property_panel/layout.dart';
import 'package:flutter_figma_app/layouts/result/widgets/rfw_code/layout.dart';
import 'package:flutter_figma_app/layouts/result/widgets/theme/layout.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/tabs.dart';

import 'widgets/component_menu/layout.dart';
import 'widgets/dart_code/layout.dart';
import 'widgets/data/layout.dart';
import 'widgets/preview/layout.dart';

class ResultLayout extends StatefulWidget {
  const ResultLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultLayout> createState() => _ResultLayoutState();
}

class _ResultLayoutState extends State<ResultLayout> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Material(
      color: theme.color.background1,
      child: LibraryLoader(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              width: 320,
              child: ResultComponentList(),
            ),
            Container(
              width: 2,
              color: theme.color.background3,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTabs(
                    selected: selectedTab,
                    onSelected: (v) => setState(() {
                      selectedTab = v;
                    }),
                    items: const [
                      AppTabItem('Flutter Preview'),
                      AppTabItem('Dart Code'),
                      AppTabItem('Remote Code'),
                      AppTabItem('Data'),
                      AppTabItem('Theme'),
                    ],
                  ),
                  Expanded(
                    child: () {
                      switch (selectedTab) {
                        case 1:
                          return const DartCode();
                        case 2:
                          return const RfwCode();
                        case 3:
                          return const DataPreview();
                        case 4:
                          return const SelectedComponentThemePreview();
                        default:
                          return Container(
                            color: theme.color.background1,
                            child: const ResultPreview(),
                          );
                      }
                    }(),
                  ),
                ],
              ),
            ),
            Container(
              width: 2,
              color: theme.color.background3,
            ),
            SizedBox(
              width: 260,
              child: PropertyPanel(
                selectedTab: selectedTab,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
