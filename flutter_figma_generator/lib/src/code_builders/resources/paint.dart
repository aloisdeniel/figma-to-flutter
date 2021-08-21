import 'package:figma/figma.dart';
import 'package:flutter_figma_generator/src/code_builders/helpers/instance.dart';

extension PaintCodeBuilderExtensions on Paint {
  ValueBuilder toCodeBuilder({
    required ValueBuilder paintColor,
    required ListValueBuilder gradientColors,
  }) {
    if (type == PaintType.solid) {
      return InstanceBuilder('FigmaSolidPaint', [
        NamedArgument('color', paintColor),
      ]);
    } else if (type == PaintType.gradientLinear) {
      final begin =
          gradientHandlePositions?.elementAt(0) ?? Vector2D(x: 0, y: 0);
      final end = gradientHandlePositions?.elementAt(1) ?? Vector2D(x: 0, y: 0);
      final beginAlign = InstanceBuilder('Alignment', [
        RequiredArgument((begin.x - 0.5) * 2.0),
        RequiredArgument((begin.y - 0.5) * 2.0),
      ]);
      final endAlign = InstanceBuilder('Alignment', [
        RequiredArgument((end.x - 0.5) * 2.0),
        RequiredArgument((end.y - 0.5) * 2.0),
      ]);
      final stops = ListValueBuilder(
        gradientStops?.map((x) => ConstantBuilder(x.position)).toList() ??
            const <ConstantBuilder>[],
      );
      return InstanceBuilder('FigmaGradientLinearPaint', [
        NamedArgument(
          'gradient',
          InstanceBuilder('LinearGradient', [
            NamedArgument('begin', beginAlign),
            NamedArgument('end', endAlign),
            NamedArgument('colors', gradientColors),
            NamedArgument('stops', stops),
            NamedArgument('tileMode', RawValueBuilder('TileMode.clamp')),
          ]),
        ),
      ]);
    } else if (type == PaintType.gradientRadial) {
      final begin =
          gradientHandlePositions?.elementAt(0) ?? Vector2D(x: 0, y: 0);
      final end = gradientHandlePositions?.elementAt(1) ?? Vector2D(x: 0, y: 0);
      final beginAlign = InstanceBuilder('Alignment', [
        RequiredArgument((begin.x - 0.5) * 2.0),
        RequiredArgument((begin.y - 0.5) * 2.0),
      ]);
      final radius = ConstantBuilder(
        ((end.x - 0.5) * 2.0) - ((begin.x - 0.5) * 2.0),
      );
      final stops = ListValueBuilder(
        gradientStops?.map((x) => ConstantBuilder(x.position)).toList() ??
            const <ConstantBuilder>[],
      );
      return InstanceBuilder('FigmaGradientRadialPaint', [
        NamedArgument(
          'gradient',
          InstanceBuilder('RadialGradient', [
            NamedArgument('center', beginAlign),
            NamedArgument('radius', radius),
            NamedArgument('colors', gradientColors),
            NamedArgument('stops', stops),
            NamedArgument('tileMode', RawValueBuilder('TileMode.clamp')),
          ]),
        ),
      ]);
    }
    return ConstantBuilder(null);
  }
}
