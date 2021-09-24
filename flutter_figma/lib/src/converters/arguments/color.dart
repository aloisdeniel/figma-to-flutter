import 'package:figma/figma.dart' as figma;

int convertColor(figma.Color node, [double opacity = 1.0]) {
  var ir = ((node.r ?? 0.0) * 255).toInt();
  var ig = ((node.g ?? 0.0) * 255).toInt();
  var ib = ((node.b ?? 0.0) * 255).toInt();
  var ia = (opacity * (node.a ?? 1.0) * 255).toInt();
  return (((ia & 0xff) << 24) |
          ((ir & 0xff) << 16) |
          ((ig & 0xff) << 8) |
          ((ib & 0xff) << 0)) &
      0xFFFFFFFF;
}
