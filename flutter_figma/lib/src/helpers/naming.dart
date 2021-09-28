import 'package:recase/recase.dart';

var _digit = RegExp(r'[0-9]');

extension NamingExtensions on String {
  String asFieldName() {
    final cased = ReCase(this);
    final result = cased.camelCase._removeSpecialCharacters();

    if (result.startsWith(_digit)) {
      return 'd$result';
    }

    return result;
  }

  String asClassName({bool isPrivate = false}) {
    final cased = ReCase(this);
    final result =
        (isPrivate ? '_' : '') + cased.pascalCase._removeSpecialCharacters();

    if (result.startsWith(_digit)) {
      return 'd$result';
    }

    return result;
  }

  String _removeSpecialCharacters() {
    final result = StringBuffer();
    final regexp = RegExp('[a-zA-Z0-9]');
    for (var i = 0; i < length; i++) {
      final character = this[i];
      if (regexp.allMatches(character).isNotEmpty) {
        result.write(character);
      }
    }

    return result.toString();
  }
}
