
import 'package:code_builder/code_builder.dart';
import 'node.dart';

class GroupGenerator {

  final NodeGenerator _node; 

  GroupGenerator(this._node);

  List<Code> generate(dynamic map) {
    var result = List<Code>();
    map["children"].forEach((x) {
       var code = this._node.generate(x,map);
       result.addAll(code);
    });

    return result;
  }
}