import 'dart:convert';
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
  parser.addFlag('withComments', abbr: 'c', defaultsTo: false);

  var results = parser.parse(args);

  // check
  if(results["token"] == null) return print("a token must be provided");
  if(results["output"] == null) return print("an ouput file path must be provided");
  if(results["fileKey"] == null) return print("a fileKey must be provided");

  var api = FigmaApiGenerator(Client(), results["token"]);
  var file = await api.getFile(results["fileKey"]);

  await (new File(results["output"] + ".json")).writeAsString(json.encode(file));

  var generator = FigmaGenerator(file);

  var widgets = Map<String,String>();
  (results["widget"] ?? []).forEach((w) {
    widgets[w] = w;
  });

  var code = generator.generateComponents(widgets, withComments: true);
  
  // Writing to file
  await (new File(results["output"])).writeAsString(code);
}