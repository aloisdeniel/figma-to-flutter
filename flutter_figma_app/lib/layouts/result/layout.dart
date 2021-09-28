import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/layouts/result/widgets/library_loader.dart';
import 'package:flutter_figma_app/layouts/result/widgets/rfw_code.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/tabs.dart';

import 'widgets/component_list.dart';
import 'widgets/dart_code.dart';
import 'widgets/preview.dart';

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
                      AppTabItem('Flutter Dart Code'),
                      AppTabItem('Remote Flutter Widget'),
                    ],
                  ),
                  Expanded(
                    child: () {
                      switch (selectedTab) {
                        case 1:
                          return const DartCode();
                        case 2:
                          return const RfwCode();
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
            )
          ],
        ),
      ),
    );
  }
}
