@JS()
library figma_flutter;

import 'package:js/js.dart';
import 'dart:async';
import 'dart:html';

import 'package:flutter_figma_generator/flutter_figma_generator.dart';
import 'package:flutter_figma_generator/widgets.dart';
import 'package:http/browser_client.dart';

@JS()
external void updateCode(String code);

void main() {

  var submit = querySelector('#submit') as ButtonElement;
  var components = querySelector('#components');
  var token = querySelector('#token') as InputElement;
  var fileKey = querySelector('#fileKey') as InputElement;
  var result = querySelector('#result');

  token.value = window.localStorage['token'];
  fileKey.value = window.localStorage['fileKey'];

  Future downloadFile() async {
    try {
      print("Starting download...");

      window.localStorage['token'] = token.value;
      window.localStorage['fileKey'] = fileKey.value;

      var api = FigmaApiGenerator(BrowserClient(), token.value);
      print("Starting request...");
      var file = await api.getFile(fileKey.value);
      var generator = FigmaWidgetGenerator(file);

      List<Element> lis = [];

      file["components"].forEach((String k,v) {
        var widgetName = v["name"].toString();
        var li = LIElement();
        li.id = k.toString();
        li.text = widgetName;
        print("Found component '${widgetName}'...");
        li.onClick.listen((c) async {
          print("Generating component...");
          var code =  await generator.generateComponents({ 
            "Custom" : widgetName,
          });
          updateCode(code);
        });
        lis.add(li);
      });

      components.children.addAll(lis);
    }
    catch(e) {
      print(e?.toString());
    }
  }

  print("Start");
  submit.onClick.listen((c) {
    downloadFile();
  });
}

