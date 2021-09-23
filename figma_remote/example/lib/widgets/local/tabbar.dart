import 'package:flutter/widgets.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({
    Key? key,
    this.tabCount = 3,
    this.selectedTab = 0,
    this.onSelectedTabChanged,
  }) : super(key: key);

  final int tabCount;
  final int selectedTab;
  final ValueChanged<int>? onSelectedTabChanged;

  @override
  Widget build(BuildContext context) {
    throw Exception('Must be generated');
  }
}
