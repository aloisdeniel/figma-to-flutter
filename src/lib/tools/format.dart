import 'package:recase/recase.dart';

String _removeSpecialChars(value) {
  return value.replaceAll(new RegExp("[^a-zA-Z0-9]"), "_");
}

String toVariableName(String name) {
  name = _removeSpecialChars(name);
  return name[0].toLowerCase() + name.substring(1);
}

String toClassName(String name) {
  var rc = new ReCase(name);
  var className = rc.pascalCase;
  return _removeSpecialChars(className);
}