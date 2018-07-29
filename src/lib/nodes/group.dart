
import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/context.dart';
import 'node.dart';

class GroupGenerator {

  final NodeGenerator _node; 

  GroupGenerator(this._node);

  void generate(BuildContext context, dynamic map) {
    map["children"].forEach((x) {
       this._node.generate(context,x,map);
    });
  }
}