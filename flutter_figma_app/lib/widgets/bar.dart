import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      color: theme.color.background2,
      height: theme.textStyle.body1.fontSize! * 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
