import 'package:example/widgets/base/tap.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../local/tabbar.dart' as local;

class Tabbar extends local.Tabbar {
  const Tabbar({
    Key? key,
    int selectedTab = 0,
    ValueChanged<int>? onSelectedTabChanged,
  }) : super(
          key: key,
          selectedTab: selectedTab,
          onSelectedTabChanged: onSelectedTabChanged,
        );

  @override
  Widget build(BuildContext context) {
    const indexToVariants = {
      0: 'Spots',
      1: 'Search',
      2: 'Settings',
    };
    return RemoteFigmaComponent(
      componentName: 'Tabbar',
      variants: {
        'Selected': indexToVariants[selectedTab] ?? '',
      },
      renderer: (parent, name, variants, instanceName) {
        if (name == 'Tab') {
          return Tap(
            child: parent(),
            onTap: () {
              onSelectedTabChanged?.call(int.parse(instanceName) - 1);
            },
          );
        }
        return parent();
      },
    );
  }
}
