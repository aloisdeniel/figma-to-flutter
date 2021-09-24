import 'package:example/widgets/base/indicator.dart';
import 'package:flutter/widgets.dart';

class SpotIndicator extends StatelessWidget {
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
  Widget build(BuildContext context) {
    throw Exception('Must be generated');
  }
}
