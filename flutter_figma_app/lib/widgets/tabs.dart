import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';

import 'bar.dart';

class AppTabItem {
  const AppTabItem(this.title);
  final String title;
}

class AppTabs extends StatelessWidget {
  const AppTabs({
    Key? key,
    required this.items,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final int selected;
  final ValueChanged<int> onSelected;
  final List<AppTabItem> items;

  @override
  Widget build(BuildContext context) {
    return MenuBar(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...items.asMap().entries.map(
                    (x) => AppTab(
                      title: x.value.title,
                      isSelected: x.key == selected,
                      onTap: () => onSelected(x.key),
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}

class AppTab extends StatelessWidget {
  const AppTab({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      color: isSelected ? theme.color.primary1.withOpacity(0.12) : null,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.edgeInsets.big.left,
            vertical: theme.edgeInsets.regular.left,
          ),
          child: Center(
            child: Text(
              title,
              style: theme.textStyle.title3.copyWith(
                color:
                    isSelected ? theme.color.primary1 : theme.color.foreground1,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
