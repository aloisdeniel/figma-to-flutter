import 'package:example/widgets/base/tap.dart';
import 'package:figma_remote/figma_remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../local/tabbar.dart' as local;

class Tabbar extends local.Tabbar {
  const Tabbar({
    Key? key,
    required int tabCount,
  }) : super(
          key: key,
          tabCount: tabCount,
        );

  @override
  Widget build(BuildContext context) {
    return RemoteFigmaComponent(
      componentName: 'Tabbar',
      variants: const {
        'Selected': 'Search',
        'Count': '3',
      },
      renderer: (parent, name, variants, instanceName) {
        if (name == 'Tab') {
          return Tap(
            child: parent(),
            onTap: () {
              print('---TAP---');
              print(name);
              print(instanceName);
              print(variants);
            },
          );
        }
        return parent();
      },
    );
  }
}
