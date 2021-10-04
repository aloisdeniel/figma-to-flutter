import 'package:flutter_figma/src/converters/arguments/border_radius.dart';
import 'package:flutter_figma/src/converters/arguments/color.dart';
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:rfw/formats.dart';
import 'package:figma/figma.dart' as figma;

BlobNode wrapBackgroundBlurred(
  FigmaComponentContext context,
  String name,
  BlobNode node,
  List<figma.Effect>? effects,
  List<num>? rectangleCornerRadii,
  num? cornerSmoothing,
) {
  if (effects == null) {
    return node;
  }

  effects = effects.where((x) => x.visible).toList();

  final borderRadius =
      convertBorderRadius(rectangleCornerRadii, cornerSmoothing);
  for (var effect in effects.where((x) => x.visible)) {
    if (effect.type == figma.EffectType.dropShadow) {
      final shadowColorName = effect.color == null
          ? null
          : context.theme.colors.create(convertColor(effect.color!, 1.0), name);
      node = ConstructorCall(
        'SmoothContainer',
        {
          'borderRadius': borderRadius,
          'decoration': {
            'shadows': [
              {
                if (shadowColorName != null)
                  'color': StateReference(['theme', 'Color', shadowColorName]),
                'blurRadius': effect.radius ?? 0.0,
              }
            ],
          },
          'child': node,
        },
      );
    } else if (effect.type == figma.EffectType.backgroundBlur) {
      node = ConstructorCall(
        'BackdropFilter',
        {
          'filter': {
            'type': 'blur',
            'sigmaX': (effect.radius ?? 0) / 5,
            'sigmaY': (effect.radius ?? 0) / 5,
          },
          'child': node,
        },
      );
      node = ConstructorCall(
        'ClipRRect',
        {
          'borderRadius': borderRadius,
          'child': node,
        },
      );
    }
  }

  return node;
}
