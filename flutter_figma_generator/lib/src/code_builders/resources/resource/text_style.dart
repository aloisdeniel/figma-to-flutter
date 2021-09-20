import 'package:figma/figma.dart';
import 'package:flutter_figma_generator/src/code_builders/helpers/instance.dart';

import 'resource.dart';

class TextStyleResource extends Resource {
  const TextStyleResource(
    String name,
    String instance,
  ) : super(name, instance);

  factory TextStyleResource.fromFigma({
    required String name,
    required TypeStyle style,
    required Resource color,
    String? package,
  }) {
    final isUnderlined = style.textDecoration == TextDecoration.underline;
    final builder = InstanceBuilder('TextStyle', [
      NamedArgument(
        'color',
        'colors.${color.name}',
      ),
      if (style.fontFamily != null)
        NamedArgument(
          'fontFamily',
          style.fontFamily!,
        ),
      if (package != null)
        NamedArgument(
          'package',
          package,
        ),
      NamedArgument(
        'fontSize',
        style.fontSize?.toDouble() ?? 12,
      ),
      NamedArgument(
        'decoration',
        RawValueBuilder(
          'TextDecoration.${isUnderlined ? 'underline' : 'none'}',
        ),
      ),
      NamedArgument(
        'decorationStyle',
        isUnderlined
            ? RawValueBuilder('TextDecorationStyle.solid')
            : ConstantBuilder(null),
      ),
      NamedArgument(
        'decorationThickness',
        isUnderlined ? 1 : ConstantBuilder(null),
      ),
      NamedArgument(
        'fontWeight',
        RawValueBuilder(
          'FondWeight.w${style.fontWeight?.toInt() ?? 400}',
        ),
      ),
    ]);

    return TextStyleResource(name, builder.build());
  }
}
