import 'package:figma/figma.dart';

import 'package:flutter_figma/src/code_builders/helpers/instance.dart';

extension ColorCodeBuilderExtensions on Color {
  InstanceBuilder toCodeBuilder(
    double opacity,
  ) {
    var ir = ((r ?? 0.0) * 255).toInt();
    var ig = ((g ?? 0.0) * 255).toInt();
    var ib = ((b ?? 0.0) * 255).toInt();
    var ia = (opacity * (a ?? 1.0) * 255).toInt();

    return InstanceBuilder('Color.fromARGB', [
      RequiredArgument(ia),
      RequiredArgument(ir),
      RequiredArgument(ig),
      RequiredArgument(ib),
    ]);
  }
}
