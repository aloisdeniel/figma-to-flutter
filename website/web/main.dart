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

var selectedComponents = [];

void main() {

  var submit = querySelector('#submit') as ButtonElement;
  var generate = querySelector('#generate') as ButtonElement;
  var sectionComponents = querySelector('#section-components');
  var components = querySelector('#components');
  var token = querySelector('#token') as InputElement;
  var fileKey = querySelector('#fileKey') as InputElement;
  var result = querySelector('#result');
  var fileTitle = querySelector('#file-title');

  token.value = window.localStorage['token'];
  fileKey.value = window.localStorage['fileKey'];

  dynamic file;

  void updateSelectedItems() {
    components.children.forEach((item) {
      if(selectedComponents.contains(item.querySelector("h2").text)) {
        item.classes = ["component", "selected"];
      }
      else {
        item.classes = ["component"];
      }
    });
  }

  Future generateCode() async {
    print("Generating components...");

    var widgets = Map<String,String>();

    selectedComponents.forEach((s) {
      widgets[s] = s;
    });

    var  generator = FigmaWidgetGenerator(file);
    var code =  await generator.generateComponents(widgets);
    updateCode(code);
  }

  LIElement createComponentLi(String widgetName) {
    var li = LIElement();
    li.classes = ["component"];
    li.id = widgetName;

    var icon = ImageElement();
    icon.src = "component.svg";
    li.children.add(icon);

    var checkbox = DivElement();
    checkbox.classes = ["checkbox"];
    var icon_check = ImageElement();
    icon_check.src = "check.svg";
    checkbox.children.add(icon_check);

    li.children.add(checkbox);

    var title = HeadingElement.h2();
    title.text = widgetName;
    li.children.add(title);

    li.onClick.listen((item) async {
      if(selectedComponents.contains(widgetName)) {
        selectedComponents.remove(widgetName);
      }
      else {
        selectedComponents.add(widgetName);
      }
      updateSelectedItems();
    });

    return li;
  }

  Future downloadFile() async {
    try {
      print("Starting download...");

      window.localStorage['token'] = token.value;
      window.localStorage['fileKey'] = fileKey.value;

      var api = FigmaApiGenerator(BrowserClient(), token.value);
      print("Starting request...");
      file = await api.getFile(fileKey.value);

      // Succeeded
      fileTitle.text = "file: " + file["name"];
      sectionComponents.classes.remove("not-visible");
      selectedComponents = [];

      List<Element> lis = [];

      file["components"].forEach((String k,v) {
        var widgetName = v["name"].toString();
        var li = createComponentLi(widgetName);
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
  generate.onClick.listen((c) {
    generateCode();
  });
}

