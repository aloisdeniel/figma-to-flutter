import 'package:example/widgets/base/indicator.dart';
import 'package:example/widgets/base/tap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:figma_squircle/figma_squircle.dart';

import 'spot_indicator.dart';

class SpotTile extends RemoteWidget {
  const SpotTile({
    Key? key,
    required this.name,
    required this.positive,
    required this.positiveIndicators,
    required this.negativeIndicators,
    this.onTap,
  }) : super(key: key);

  final String name;
  final double positive;
  final Map<ConditionIndicator, String> positiveIndicators;
  final Map<ConditionIndicator, String> negativeIndicators;
  final VoidCallback? onTap;

  @override
  String get remoteIdentifier => 'figma';

  @override
  String get remoteWidgetName => FigmaRemote.nameForVariants(
        'SpotCard',
        {
          'Mode': positive > 0.5 ? 'Good' : 'Bad',
        },
      );

  @override
  int get version => 1;

  @override
  Map<String, Object?> get remoteData => {
        'text': {
          'name': name,
          'description': '${(positive * 100).toInt()}% de conditions positives'
        }
      };

  @override
  Widget renderComponent(
    Widget Function() render,
    String name,
    Map<String, String> variants,
    String instanceName,
  ) {
    if (name == 'SpotIndicators') {
      return Wrap(
        direction: Axis.horizontal,
        spacing: 4,
        runSpacing: 4,
        children: [
          ...positiveIndicators.entries.map(
            (x) => SpotIndicator(
              indicator: x.key,
              value: x.value,
            ),
          ),
          ...negativeIndicators.entries.map(
            (x) => SpotIndicator(
              indicator: x.key,
              value: x.value,
              isPositive: false,
            ),
          ),
        ],
      );
    }
    return render();
  }

  @override
  Widget buildLocal(BuildContext context) {
    return const Text('Not Implemented');
  }

  @override
  Widget build(BuildContext context) {
    final isPositive = positive > 0.5;
    return Tap(
      onTap: onTap,
      color: !isPositive ? const Color(0xFFE96980) : null,
      borderRadius: SmoothBorderRadius(cornerRadius: 8.0),
      child: SizedBox(
        height: 140,
        child: super.build(context),
      ),
    );
  }
}
