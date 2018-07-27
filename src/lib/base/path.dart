
import 'package:code_builder/code_builder.dart';
import '../parsing/parse_path.dart';

class PathGenerator {
  
  int _index = 0;
  ClassBuilder _catalog = new ClassBuilder()..name = "_PathCatalog";

  PathGenerator() {
  }

  Class buildCatalog() {

    var constructorBody = BlockBuilder();

    for (var i = 0; i < _index; i++) {
      _catalog.fields.add(Field((b) => b
        ..name = "path_$i"
        ..type = refer("Path")
      )); 
      constructorBody.statements
        ..add(Code("this.path_$i = _build_$i();")); 
    }

    _catalog.fields.add(Field((b) => b
        ..name = "instance"
        ..static = true
        ..modifier = FieldModifier.final$
        ..type = refer("_PathCatalog")
        ..assignment = Code("new _PathCatalog()")
      ));

    _catalog.constructors.add(Constructor((b) => b
      ..body = constructorBody.build()
    ));

    return _catalog.build();
  }

  int _addPath(map) {
    var statement = List<Code>();
    var svg = map["path"] as String;

    if (svg == null) {
      statement = [Code("Path()")];
    }
    else if (svg == '') {
      statement = [Code("Path()")];
    }
    else {
      final SvgPathStringSource parser = new SvgPathStringSource(svg);
      final SvgPathNormalizer normalizer = new SvgPathNormalizer();
      var segments = parser.parseSegments();
      for (PathSegmentData seg in segments) {
        statement.addAll(normalizer.emitSegment(seg).map((c) => Code(_generateCommand(c).toString() + ";")));
      }
    }
    var method = Method((b) => b
      ..name = "_build_$_index"
      ..static = true
      ..returns = refer("Path")
      ..body = Block((c) => c.statements
        ..add(new Code("var path = Path();"))
        ..addAll(statement)
        ..add(new Code("return path;")))
    );

    _catalog.methods.add(method);

    _index++;
    return _index - 1;
  }

  Code generate(map) {
    var index = _addPath(map);
    return Code("_PathCatalog.instance.path_${index}");
  }
  
  Code _generateCommand(PathSegmentData segment) {
    switch (segment.command) {
      case SvgPathSegType.moveToRel:
      case SvgPathSegType.moveToAbs:
        return Code("path.moveTo(${segment.targetPoint.x}, ${segment.targetPoint.y})");
        break;
      case SvgPathSegType.lineToRel:
      case SvgPathSegType.lineToAbs:
      case SvgPathSegType.lineToHorizontalRel:
      case SvgPathSegType.lineToHorizontalAbs:
      case SvgPathSegType.lineToVerticalRel:
      case SvgPathSegType.lineToVerticalAbs:
        return Code("path.lineTo(${segment.targetPoint.x}, ${segment.targetPoint.y})");
        break;
      case SvgPathSegType.close:
        return Code("path.close()");
        break;
      case SvgPathSegType.cubicToRel:
      case SvgPathSegType.cubicToAbs:
        return Code("path.cubicTo(${segment.point1.x}, ${segment.point1.y}, ${segment.point2.x}, ${segment.point2.y}, ${segment.targetPoint.x}, ${segment.targetPoint.y})");
        break;
      case SvgPathSegType.quadToRel:
      case SvgPathSegType.quadToAbs:
        return Code("path.cubicTo(${segment.point1.x}, ${segment.point1.y}, ${segment.point2.x}, ${segment.point2.y}, ${segment.targetPoint.x}, ${segment.targetPoint.y})");
        break;
      case SvgPathSegType.smoothCubicToRel:
      case SvgPathSegType.smoothCubicToAbs:
      case SvgPathSegType.smoothQuadToRel:
      case SvgPathSegType.smoothQuadToAbs:
      case SvgPathSegType.arcToRel:
      case SvgPathSegType.arcToAbs:
      default:
        throw new StateError('Invalid command type in path');
    }
  }
}