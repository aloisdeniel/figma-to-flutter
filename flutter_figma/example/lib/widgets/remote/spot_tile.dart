import 'package:example/widgets/base/indicator.dart';
import 'package:example/widgets/base/tap.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';

import 'spot_indicator.dart';
import '../local/spot_tile.dart' as local;

class SpotTile extends local.SpotTile {
  const SpotTile({
    Key? key,
    required String name,
    required double positive,
    required Map<ConditionIndicator, String> negativeIndicators,
    required Map<ConditionIndicator, String> positiveIndicators,
    VoidCallback? onTap,
  }) : super(
          key: key,
          name: name,
          positive: positive,
          negativeIndicators: negativeIndicators,
          positiveIndicators: positiveIndicators,
          onTap: onTap,
        );

  @override
  Widget build(BuildContext context) {
    final isPositive = positive > 0.5;
    return Tap(
      onTap: onTap,
      color: !isPositive ? const Color(0xFFE96980) : null,
      borderRadius: SmoothBorderRadius(cornerRadius: 8.0),
      child: SizedBox(
        height: 140,
        child: RemoteFigmaComponent(
          componentName: 'SpotCard',
          variants: {
            'Mode': isPositive ? 'Good' : 'Bad',
          },
          data: RemoteFigmaData(
            text: {
              'name': name,
              'description':
                  '${(positive * 100).toInt()}% de conditions positives'
            },
          ),
          renderer: (parent, name, variants, instanceName) {
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
            return parent();
          },
        ),
      ),
    );
  }
}
