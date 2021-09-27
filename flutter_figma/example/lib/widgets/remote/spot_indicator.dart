import 'package:example/widgets/base/capitalize.dart';
import 'package:example/widgets/base/indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';

class SpotIndicator extends RemoteWidget {
  const SpotIndicator({
    Key? key,
    required this.value,
    required this.indicator,
    this.isPositive = true,
  }) : super(key: key);

  final String value;
  final bool isPositive;
  final ConditionIndicator indicator;

  @override
  String get remoteIdentifier => 'figma';

  @override
  String get remoteWidgetName => FigmaRemote.nameForVariants(
        'SpotIndicator',
        {
          'Indicator': describeEnum(indicator).capitalize(),
          'State': isPositive ? 'Positive' : 'Negative',
        },
      );

  @override
  int get version => 1;

  @override
  Map<String, Object?> get remoteData => {
        'text': {
          'value': value,
        }
      };

  @override
  Widget buildLocal(BuildContext context) {
    return const Text('Not Implemented');
  }
}
