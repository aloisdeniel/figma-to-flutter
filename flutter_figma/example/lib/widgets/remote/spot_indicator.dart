import 'package:example/widgets/base/capitalize.dart';
import 'package:example/widgets/base/indicator.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../local/spot_indicator.dart' as local;

class SpotIndicator extends local.SpotIndicator {
  const SpotIndicator({
    Key? key,
    required String value,
    required ConditionIndicator indicator,
    bool isPositive = true,
  }) : super(
          key: key,
          value: value,
          indicator: indicator,
          isPositive: isPositive,
        );

  @override
  Widget build(BuildContext context) {
    return RemoteFigmaComponent(
      componentName: 'SpotIndicator',
      variants: {
        'State': isPositive ? 'Positive' : 'Negative',
        'Indicator': describeEnum(indicator).capitalize(),
      },
      data: RemoteFigmaData(
        text: {
          'value': value,
        },
      ),
    );
  }
}
