import 'package:recase/recase.dart';

String createFieldName(String name) {
  final cased = ReCase(name);
  return _removeSpecialCharacters(cased.camelCase);
}

String createClassName(String name) {
  final cased = ReCase(name);
  return _removeSpecialCharacters(cased.pascalCase);
}

String _removeSpecialCharacters(String value) {
  final result = StringBuffer();
  final regexp = RegExp('[a-zA-Z0-9]');
  for (var i = 0; i < value.length; i++) {
    final character = value[i];
    if (regexp.allMatches(character).isNotEmpty) {
      result.write(character);
    }
  }

  return result.toString();
}
