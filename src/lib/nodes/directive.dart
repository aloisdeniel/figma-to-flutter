import 'package:figma_to_flutter/context.dart';
import 'package:figma_to_flutter/parsing/declaration.dart';
import 'package:figma_to_flutter/tools/format.dart' as format;

class DirectiveGenerator {

  void _tap(BuildContext context,DirectiveItem item, dynamic map) {

      var propertyName = format.toVariableName(item.name);

      var cornerRadius = 0.0;

      var rectangleCornerRadii = map["rectangleCornerRadii"];
      if(rectangleCornerRadii != null) {
        cornerRadius = rectangleCornerRadii[0].toDouble();
      }

      var instance = "InkWell(onTap: $propertyName, borderRadius: BorderRadius.all(Radius.circular($cornerRadius)))";

      context.addWidgetField("GestureTapCallback", propertyName);
      context.addChildWidget(instance, map);
  }

  void _widget(BuildContext context, DirectiveItem item, dynamic map) {

      var propertyName = format.toVariableName(item.name);

      var instance = "this.$propertyName";
      
      context.addWidgetField("Widget", propertyName);
      context.addChildWidget(instance, map);
  }

  bool generate(BuildContext context, dynamic map) {
    var declaration = Declaration.parse(map["name"]) as DirectiveItem;

    if(declaration.directive == "tap" && map["type"] == "RECTANGLE") {
      _tap(context,declaration,map);
      return true;
    }

    if(declaration.directive == "widget") {
      _widget(context,declaration,map);
      return true;
    } 

    return false;
  }
}