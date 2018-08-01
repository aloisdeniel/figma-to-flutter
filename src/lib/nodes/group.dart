
import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/context.dart';
import 'node.dart';

class GroupGenerator {

  final NodeGenerator _node; 

  GroupGenerator(this._node);

  bool isSupported(dynamic map) {
    const supported = [ 
      'GROUP'
    ];
    return supported.contains(map["type"]);
  }

  void generate(BuildContext context, dynamic map, dynamic parent) {
    map["children"].forEach((x) {
       this._node.generate(context,x,parent);
    });
  }
}