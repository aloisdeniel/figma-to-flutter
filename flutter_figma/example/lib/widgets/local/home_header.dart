import 'package:flutter/widgets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
    this.welcome = 'Welcome',
    required this.name,
  }) : super(key: key);

  final String welcome;
  final String name;

  @override
  Widget build(BuildContext context) {
    throw Exception('Must be generated');
  }
}
