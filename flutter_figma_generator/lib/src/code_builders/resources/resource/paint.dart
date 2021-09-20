import 'package:figma/figma.dart';
import 'package:flutter_figma_generator/src/code_builders/helpers/instance.dart';

import 'resource.dart';

class PaintResource extends Resource {
  const PaintResource(
    String name,
    String instance,
  ) : super(name, instance);

  factory PaintResource.fromFigma({
    required String name,
    required Paint paint,
    required Resource color,
    required List<Resource> gradientColors,
    double opacity = 1.0,
  }) {
    final builder = () {
      if (paint.type == PaintType.solid) {
        return InstanceBuilder('FigmaSolidPaint', [
          NamedArgument('color', 'colors.${color.name}'),
        ]);
      } else if (paint.type == PaintType.gradientLinear) {
        final begin =
            paint.gradientHandlePositions?.elementAt(0) ?? Vector2D(x: 0, y: 0);
        final end =
            paint.gradientHandlePositions?.elementAt(1) ?? Vector2D(x: 0, y: 0);
        final beginAlign = InstanceBuilder('Alignment', [
          RequiredArgument((begin.x - 0.5) * 2.0),
          RequiredArgument((begin.y - 0.5) * 2.0),
        ]);
        final endAlign = InstanceBuilder('Alignment', [
          RequiredArgument((end.x - 0.5) * 2.0),
          RequiredArgument((end.y - 0.5) * 2.0),
        ]);
        final stops = ListValueBuilder(
          paint.gradientStops
                  ?.map((x) => ConstantBuilder(x.position))
                  .toList() ??
              const <ConstantBuilder>[],
        );
        return InstanceBuilder('FigmaGradientLinearPaint', [
          NamedArgument(
            'gradient',
            InstanceBuilder('LinearGradient', [
              NamedArgument('begin', beginAlign),
              NamedArgument('end', endAlign),
              NamedArgument(
                'colors',
                ListValueBuilder(
                  gradientColors
                      .map((x) => RawValueBuilder('colors.${color.name}'))
                      .toList(),
                ),
              ),
              NamedArgument('stops', stops),
              NamedArgument('tileMode', RawValueBuilder('TileMode.clamp')),
            ]),
          ),
        ]);
      } else if (paint.type == PaintType.gradientRadial) {
        final begin =
            paint.gradientHandlePositions?.elementAt(0) ?? Vector2D(x: 0, y: 0);
        final end =
            paint.gradientHandlePositions?.elementAt(1) ?? Vector2D(x: 0, y: 0);
        final beginAlign = InstanceBuilder('Alignment', [
          RequiredArgument((begin.x - 0.5) * 2.0),
          RequiredArgument((begin.y - 0.5) * 2.0),
        ]);
        final radius = ConstantBuilder(
          ((end.x - 0.5) * 2.0) - ((begin.x - 0.5) * 2.0),
        );
        final stops = ListValueBuilder(
          paint.gradientStops
                  ?.map((x) => ConstantBuilder(x.position))
                  .toList() ??
              const <ConstantBuilder>[],
        );
        return InstanceBuilder('FigmaGradientRadialPaint', [
          NamedArgument(
            'gradient',
            InstanceBuilder('RadialGradient', [
              NamedArgument('center', beginAlign),
              NamedArgument('radius', radius),
              NamedArgument(
                'colors',
                ListValueBuilder(
                  gradientColors
                      .map((x) => RawValueBuilder('colors.${color.name}'))
                      .toList(),
                ),
              ),
              NamedArgument('stops', stops),
              NamedArgument('tileMode', RawValueBuilder('TileMode.clamp')),
            ]),
          ),
        ]);
      }
    }();

    return PaintResource(name, builder!.build());
  }
}
