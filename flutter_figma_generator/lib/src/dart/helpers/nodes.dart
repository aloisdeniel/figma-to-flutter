import 'package:flutter/material.dart';
import 'package:flutter_figma_generator/src/dart/helpers/arguments.dart';
import 'package:rfw/dart/model.dart';
import 'package:collection/collection.dart';

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

  void listArg(String name, List<String>? items) {
    if (items != null) {
      result.writeln('$name: [');
      for (var item in items) {
        result.writeln('$item,');
      }
      result.writeln('],');
    }
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
      listArg(
        'children',
        [
          ...children.map((child) => buildNode(child)),
        ],
      );
    }
  }

  switch (node.name) {
    case 'PathView':
      instance('PathView', () {
        final geometry = node.arguments['geometry'] as List?;
        if (geometry != null && geometry.isNotEmpty) {
          listArg(
            'geometry',
            [
              ...geometry
                  .map((child) => ArgumentEncoders.geometry(child))
                  .whereNotNull(),
            ],
          );
        }

        final fills = node.arguments['fills'] as List?;
        if (fills != null && fills.isNotEmpty) {
          listArg(
            'fills',
            [
              ...fills
                  .map((child) => ArgumentEncoders.decoration(child))
                  .whereNotNull(),
            ],
          );
        }

        final strokes = node.arguments['strokes'] as List?;
        if (strokes != null && strokes.isNotEmpty) {
          listArg(
            'strokes',
            [
              ...strokes
                  .map((child) => ArgumentEncoders.borderSide(child))
                  .whereNotNull(),
            ],
          );
        }
      });
      break;
    case 'SmoothContainer':
      instance('Container', () {
        arg(
          'decoration',
          ArgumentEncoders.decoration(node.arguments['decoration']),
        );

        childArg();
      });
      break;
    case 'Row':
    case 'Column':
      instance(node.name, () {
        arg(
          'mainAxisSize',
          ArgumentEncoders.enumeration<MainAxisSize>(
              node.arguments['mainAxisSize']),
        );
        arg(
          'crossAxisAlignment',
          ArgumentEncoders.enumeration<CrossAxisAlignment>(
              node.arguments['crossAxisAlignment']),
        );
        arg(
          'mainAxisAlignment',
          ArgumentEncoders.enumeration<MainAxisAlignment>(
              node.arguments['mainAxisAlignment']),
        );
        childrenArg();
      });
      break;
    case 'Text':
      instance(node.name, () {
        reqArg(
          ArgumentEncoders.string(node.arguments['text']) ?? 'null',
        );
        childArg();
      });
      break;
    case 'Padding':
      instance(node.name, () {
        arg(
          'padding',
          ArgumentEncoders.edgeInsets(node.arguments['padding']),
        );
        childArg();
      });
      break;
    case 'SizedBox':
      instance(node.name, () {
        arg(
          'width',
          ArgumentEncoders.size(node.arguments['width']),
        );
        arg(
          'height',
          ArgumentEncoders.size(node.arguments['height']),
        );
        childArg();
      });
      break;
    case 'Positioned':
      instance('PositionedDirectional', () {
        arg(
          'start',
          ArgumentEncoders.size(node.arguments['start']),
        );
        arg(
          'end',
          ArgumentEncoders.size(node.arguments['end']),
        );
        arg(
          'top',
          ArgumentEncoders.size(node.arguments['top']),
        );
        arg(
          'bottom',
          ArgumentEncoders.size(node.arguments['bottom']),
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
