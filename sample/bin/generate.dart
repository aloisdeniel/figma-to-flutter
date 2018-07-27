import 'dart:io';

import 'package:flutter_figma_generator/flutter_figma_generator.dart';
import 'package:http/http.dart';

void main() async {
  var api = FigmaApiGenerator(Client(), "X");
  var file = await api.getFile("X");
  var generator = FigmaWidgetGenerator(file);
  var code = generator.generateComponents({ 
    "Logo" : "Logo",
  });
  
  // Writing to file
  await (new File("lib/widgets/sample.g.dart")).writeAsString(code);
}