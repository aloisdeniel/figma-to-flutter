import 'package:example/widgets/base/tap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';

class Tabbar extends RemoteWidget {
  const Tabbar({
    Key? key,
    this.selectedTab = 0,
    this.onSelectedTabChanged,
  }) : super(key: key);

  final int selectedTab;
  final ValueChanged<int>? onSelectedTabChanged;

  @override
  String get remoteIdentifier => 'figma';

  @override
  String get remoteWidgetName {
    const indexToVariants = {
      0: 'Spots',
      1: 'Search',
      2: 'Settings',
    };

    return FigmaRemote.nameForVariants('Tabbar', {
      'Selected': indexToVariants[selectedTab]!,
    });
  }

  @override
  int get version => 1;

  @override
  Widget renderComponent(
    Widget Function() render,
    String name,
    Map<String, String> variants,
    String instanceName,
  ) {
    if (name == 'Tab') {
      return Tap(
        child: render(),
        onTap: () {
          onSelectedTabChanged?.call(int.parse(instanceName) - 1);
        },
      );
    }
    return render();
  }

  @override
  Widget buildLocal(BuildContext context) {
    return const Text('Not Implemented');
  }
}
