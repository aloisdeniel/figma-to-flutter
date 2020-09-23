import 'package:figma/figma.dart';

extension NodeExtensions on Node {
  List<Paint> extractFills() {
    final $this = this;
    if ($this is Vector) {
      return $this.fills;
    }
    if ($this is Frame) {
      return $this.fills;
    }
    if ($this is Group) {
      return $this.fills;
    }

    return const <Paint>[];
  }
}
