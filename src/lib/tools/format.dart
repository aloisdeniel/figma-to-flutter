import 'package:recase/recase.dart';

/**
 * Converts the given value to a valid property name (camelCase).
 */
String toVariableName(String name) {
  name = _removeSpecialChars(name);
  return name[0].toLowerCase() + name.substring(1);
}

/**
 * Converts the given value to a valid class name (PascalCase).
 */
String toClassName(String name) {
  var rc = new ReCase(name);
  var className = rc.pascalCase;
  return _removeSpecialChars(className);
}

/**
 * Formats the given number to a unified string representation.
 */
String toFixedDouble(double value) {
  if (value == 0) return "0.0";
  return value.toStringAsFixed(10);
}

/**
 * Removes every character that is not a digit or a number.
 */
String _removeSpecialChars(value) {
  return value.replaceAll(new RegExp("[^a-zA-Z0-9]"), "_");
}
