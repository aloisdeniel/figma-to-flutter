import 'package:figma/figma.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_figma/src/code_builders/helpers/instance.dart';

extension TextStyleCodeBuilderExtensions on TypeStyle {
  InstanceBuilder toCodeBuilder(
      {@required ValueBuilder color, String package}) {
    final isUnderlined = textDecoration == TextDecoration.underline;
    return InstanceBuilder('TextStyle', [
      NamedArgument('color', color),
      NamedArgument('fontFamily', fontFamily),
      if (package != null) NamedArgument('package', package),
      NamedArgument('fontSize', fontSize?.toDouble()),
      NamedArgument(
          'decoration',
          isUnderlined
              ? RawValueBuilder('TextDecoration.underline')
              : RawValueBuilder('TextDecoration.none')),
      NamedArgument('decorationStyle',
          isUnderlined ? RawValueBuilder('TextDecorationStyle.solid') : null),
      NamedArgument('decorationThickness', isUnderlined ? 1 : null),
      NamedArgument(
          'fontWeight', RawValueBuilder('FondWeight.w${fontWeight.toInt()}')),
    ]);
  }
}
