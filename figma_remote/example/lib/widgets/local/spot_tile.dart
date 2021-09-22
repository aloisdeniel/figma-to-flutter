import 'package:flutter/widgets.dart';

class SpotTile extends StatelessWidget {
  const SpotTile({
    Key? key,
    required this.name,
    required this.positive,
  }) : super(key: key);

  final String name;
  final double positive;

  @override
  Widget build(BuildContext context) {
    throw Exception('Must be generated');
  }
}
