import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma_app/theme/theme.dart';
import 'package:flutter_figma_app/widgets/code_span.dart';
import 'package:flutter_figma_generator/flutter_figma_generator.dart';

class TextStylePreviewTile extends StatelessWidget {
  TextStylePreviewTile({
    required this.names,
    required this.value,
  }) : super(key: ValueKey(value));

  final List<String> names;
  final Object? value;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final value = this.value;
    final textStyle = value is Map
        ? TextStyle(
            fontFamily: (value['fontFamily'] as String?),
            fontSize: (value['fontSize'] as num?)?.toDouble(),
          ).copyWith(
            color: theme.color.foreground1,
          )
        : null;
    return ListTile(
      leading: SizedBox(
        width: theme.textStyle.body1.fontSize! * 3,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'T',
            style: textStyle,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CodeSpan('const ' +
              (ArgumentEncoders.textStyle(value) ?? '').replaceAll('\n', ' ')),
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
