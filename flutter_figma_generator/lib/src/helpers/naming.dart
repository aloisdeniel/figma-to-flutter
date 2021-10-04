import 'package:flutter_figma/flutter_figma.dart';
import 'package:recase/recase.dart';

extension NamingExtensions on String {
  String asVariantClassName() {
    final splits = split('_');
    if (splits.length > 2) {
      return splits.skip(1).join('_').asClassName();
    }
    return asClassName();
  }

  String asFieldName() {
    final cased = ReCase(this);
    return cased.camelCase._removeSpecialCharacters();
  }

  String asFileName([String extension = '']) {
    final cased = ReCase(this);
    return cased.snakeCase._removeSpecialCharacters() + extension;
  }

  String asClassName({bool isPrivate = false}) {
    final cased = ReCase(this);
    return (isPrivate ? '_' : '') + cased.pascalCase._removeSpecialCharacters();
  }

  String _removeSpecialCharacters() {
    final result = StringBuffer();
    final regexp = RegExp('[a-zA-Z0-9_]');
    for (var i = 0; i < length; i++) {
      final character = this[i];
      if (regexp.allMatches(character).isNotEmpty) {
        result.write(character);
      }
    }

    return result.toString();
  }
}

extension FigmaComponentNamingExtensions on FigmaComponentBase {
  String asFileName() {
    final self = this;
    if (self is FigmaComponent || self is FigmaComponentSet) {
      return '${name.asFileName()}.dart';
    }
    if (self is FigmaComponentVariant) {
      return '${self.componentName.asFileName()}.${name.asVariantClassName().asFileName()}.dart';
    }
    throw Exception('not supported');
  }
}
