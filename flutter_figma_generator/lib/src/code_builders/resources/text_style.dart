import 'package:figma/figma.dart';
import 'package:flutter_figma_generator/src/code_builders/helpers/instance.dart';

extension TextStyleCodeBuilderExtensions on TypeStyle {
  InstanceBuilder toCodeBuilder({
    required ValueBuilder color,
    String? package,
  }) {
    final isUnderlined = textDecoration == TextDecoration.underline;
    return InstanceBuilder('TextStyle', [
      NamedArgument(
        'color',
        color,
      ),
      if (fontFamily != null)
        NamedArgument(
          'fontFamily',
          fontFamily!,
        ),
      if (package != null)
        NamedArgument(
          'package',
          package,
        ),
      NamedArgument(
        'fontSize',
        fontSize?.toDouble() ?? 12,
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
          'FondWeight.w${fontWeight?.toInt() ?? 400}',
        ),
      ),
    ]);
  }
}
