import 'package:flutter/material.dart';
import 'package:flutter_figma_generator/src/dart/helpers/arguments.dart';
import 'package:rfw/dart/model.dart';

String buildNode(BlobNode node) {
  if (node is ConstructorCall) {
    return buildConstructorCall(node);
  }
  if (node is StateReference) {
    return buildStateReference(node);
  }
  return 'null';
}

String buildStateReference(StateReference node) {
  return node.parts.join('.');
}

String buildConstructorCall(ConstructorCall node) {
  final result = StringBuffer();
  void instance(String name, void Function() build) {
    result.writeln('$name(');
    build();
    result.writeln(')');
  }

  void arg(String name, String? value) {
    if (value != null) result.writeln('$name: $value,');
  }

  void reqArg(String value) {
    result.writeln('$value,');
  }

  void childArg() {
    final child = node.arguments['child'] as BlobNode?;
    if (child != null) arg('child', buildNode(child));
  }

  void childrenArg() {
    final children = node.arguments['children'] as List?;
    if (children != null) {
      result.writeln('children: [');
      for (BlobNode? child in children) {
        if (child != null) result.writeln('${buildNode(child)},');
      }
      result.writeln('],');
    }
  }

  switch (node.name) {
    case 'SmoothContainer':
      instance('Container', () {
        arg(
          'decoration',
          buildDecoration(node.arguments['decoration']),
        );

        childArg();
      });
      break;
    case 'Row':
    case 'Column':
      instance(node.name, () {
        arg(
          'mainAxisSize',
          buildEnum<MainAxisSize>(node.arguments['mainAxisSize']),
        );
        arg(
          'crossAxisAlignment',
          buildEnum<CrossAxisAlignment>(node.arguments['crossAxisAlignment']),
        );
        arg(
          'mainAxisAlignment',
          buildEnum<MainAxisAlignment>(node.arguments['mainAxisAlignment']),
        );
        childrenArg();
      });
      break;
    case 'Text':
      instance(node.name, () {
        reqArg(
          buildString(node.arguments['text']) ?? 'null',
        );
        childArg();
      });
      break;
    case 'Padding':
      instance(node.name, () {
        arg(
          'padding',
          buildEdgeInsets(node.arguments['padding']),
        );
        childArg();
      });
      break;
    case 'SizedBox':
      instance(node.name, () {
        arg(
          'width',
          buildSize(node.arguments['width']),
        );
        arg(
          'height',
          buildSize(node.arguments['height']),
        );
        childArg();
      });
      break;
    case 'Positioned':
      instance(node.name, () {
        arg(
          'start',
          buildSize(node.arguments['start']),
        );
        arg(
          'end',
          buildSize(node.arguments['end']),
        );
        arg(
          'top',
          buildSize(node.arguments['top']),
        );
        arg(
          'bottom',
          buildSize(node.arguments['bottom']),
        );
        childArg();
      });
      break;
    default:
      instance(node.name, () {
        childArg();
        childrenArg();
      });
      break;
  }

  return result.toString();
}
