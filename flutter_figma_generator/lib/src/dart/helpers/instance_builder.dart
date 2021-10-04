class InstanceBuilder {
  InstanceBuilder(String name) : _buffer = StringBuffer('$name(');

  StringBuffer _buffer;

  set name(String v) => _buffer = StringBuffer('$v(');

  void positional(String value) {
    _buffer.writeln('$value,');
  }

  void named(String name, String? value) {
    if (value != null) _buffer.writeln('$name: $value,');
  }

  void namedList(String name, List<String?>? items) {
    if (items != null) {
      _buffer.writeln('$name: [');
      for (var item in items) {
        if (item != null) _buffer.writeln('$item,');
      }
      _buffer.writeln('],');
    }
  }

  String build() {
    _buffer.writeln(')');
    return _buffer.toString();
  }
}
