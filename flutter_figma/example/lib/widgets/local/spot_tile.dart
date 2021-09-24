import 'package:example/widgets/base/indicator.dart';
import 'package:flutter/widgets.dart';

class SpotTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    throw Exception('Must be generated');
  }
}
