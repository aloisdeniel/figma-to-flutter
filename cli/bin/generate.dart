import 'dart:io';

import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:http/http.dart';

void main() async {
  var api = FigmaApiGenerator(Client(), "X");
  var file = await api.getFile("X");
  var generator = FigmaWidgetGenerator(file);
  var code = generator.generateComponents({ 
    "Logo" : "Logo",
  });
  
  // Writing to file
  await (new File("sample/lib/widgets/sample.g.dart")).writeAsString(code);
}