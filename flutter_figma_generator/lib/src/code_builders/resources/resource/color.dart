import 'package:figma/figma.dart';
import 'package:flutter_figma_generator/src/code_builders/helpers/instance.dart';

import 'resource.dart';

class ColorResource extends Resource {
  const ColorResource(
    String name,
    String instance,
  ) : super(name, instance);

  factory ColorResource.fromFigma({
    required String name,
    required Color color,
    double opacity = 1.0,
  }) {
    var ir = ((color.r ?? 0.0) * 255).toInt();
    var ig = ((color.g ?? 0.0) * 255).toInt();
    var ib = ((color.b ?? 0.0) * 255).toInt();
    var ia = (opacity * (color.a ?? 1.0) * 255).toInt();

    final builder = InstanceBuilder('Color.fromARGB', [
      RequiredArgument(ia),
      RequiredArgument(ir),
      RequiredArgument(ig),
      RequiredArgument(ib),
    ]);

    return ColorResource(name, builder.build());
  }
}
