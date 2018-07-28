import 'dart:io';

import 'package:args/args.dart';
import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:http/http.dart';

void main(List<String> args) async {

  var parser = new ArgParser();
  parser.addOption('token', abbr: 't');
  parser.addOption('fileKey', abbr: 'f');
  parser.addMultiOption('widget', abbr: 'w');
  parser.addOption('output', abbr: 'o');

  var results = parser.parse(args);

  var api = FigmaApiGenerator(Client(), results["token"]);
  var file = await api.getFile(results["fileKey"]);
  var generator = FigmaWidgetGenerator(file);

  var widgets = Map<String,String>();
  results["widget"].forEach((w) {
    widgets[w] = w;
  });

  var code = generator.generateComponents(widgets);
  
  // Writing to file
  await (new File(results["output"])).writeAsString(code);
}