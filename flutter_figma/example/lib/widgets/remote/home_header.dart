import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';

class HomeHeader extends RemoteWidget {
  const HomeHeader({
    Key? key,
    this.welcome = 'Welcome',
    required this.name,
  }) : super(key: key);

  @override
  String get remoteIdentifier => 'figma';

  @override
  String get remoteWidgetName => 'HomeHeader';

  @override
  int get version => 1;

  @override
  Map<String, Object?> get remoteData => {
        'text': {
          'welcome': welcome,
          'name': name,
        },
      };

  final String welcome;

  final String name;

  @override
  Widget buildLocal(BuildContext context) {
    return const Text('Not Implemented');
  }
}
