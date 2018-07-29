import 'package:figma_to_flutter/context.dart';
import 'package:figma_to_flutter/parsing/declaration.dart';

class DirectiveGenerator {

  void _tap(BuildContext context, dynamic map) {

  }

  bool generate(BuildContext context, dynamic map) {
    var declaration = Declaration.parse(map["name"]) as DirectiveItem;

    if(declaration.directive == "tap" && map["type"] == "RECTANGLE") {
      _tap(context,map);
      return true;
    }
    return false;
  }
}