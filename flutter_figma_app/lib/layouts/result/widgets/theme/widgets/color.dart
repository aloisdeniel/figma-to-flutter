import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/code_span.dart';

class ColorPreviewTile extends StatelessWidget {
  ColorPreviewTile({
    required this.names,
    required this.value,
  }) : super(key: ValueKey(value));

  final List<String> names;
  final num value;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final cellSize = theme.textStyle.body1.fontSize! * 3;
    return ListTile(
      leading: Container(
        width: cellSize,
        height: cellSize,
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: theme.borderRadius.regular,
          ),
          color: Color(
            value.toInt(),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CodeSpan('const Color(0x${value.toInt().toRadixString(16)})'),
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
