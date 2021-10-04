import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/code_span.dart';

class SpacingTile extends StatelessWidget {
  SpacingTile({
    required this.names,
    required this.value,
  }) : super(key: ValueKey(value));

  final List<String> names;
  final num value;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final height = value.toDouble().abs();
    return ListTile(
      leading: Container(
        width: theme.textStyle.body1.fontSize ?? 0.0,
        height: height,
        color: value < 0 ? theme.color.thirdary1 : theme.color.primary1,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CodeSpan('const EdgeInsets.all($value)'),
          Wrap(
            runSpacing: theme.edgeInsets.small.top,
            children: [
              ...names
                  .map(
                    (x) => [
                      Text(
                        ', ',
                        style: theme.textStyle.body1.copyWith(
                          color: theme.color.foreground1.withOpacity(0.6),
                        ),
                      ),
                      SelectableText(
                        x,
                        style: theme.textStyle.body2.copyWith(
                          color: theme.color.foreground1.withOpacity(0.6),
                        ),
                      ),
                    ],
                  )
                  .expand((element) => element)
                  .skip(1),
            ],
          ),
        ],
      ),
    );
  }
}
