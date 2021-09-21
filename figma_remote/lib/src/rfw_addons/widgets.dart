import 'dart:ui';

import 'package:figma_remote/src/rfw_addons/path_view.dart';
import 'package:figma_remote/src/rfw_addons/variants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:rfw/flutter/argument_decoders.dart';
import 'package:rfw/rfw.dart';

LocalWidgetLibrary createCoreAddonsWidgets() =>
    LocalWidgetLibrary(_coreWidgetsDefinitions);

Map<String, LocalWidgetBuilder> get _coreWidgetsDefinitions =>
    <String, LocalWidgetBuilder>{
      'Variants': (BuildContext context, DataSource source) {
        final definitionCount = source.length(['definitions']);
        if (definitionCount == 0) {
          return const SizedBox();
        }
        final definitions = <VariantDefinition>[];
        for (var d = 0; d < definitionCount; d++) {
          final properties = <MapEntry<String, String>>[];
          final propertyCount = source.length(['definitions', d, 'properties']);
          for (var p = 0; p < propertyCount; p++) {
            final property =
                source.v<String>(['definitions', d, 'properties', p, 'name']);
            final value =
                source.v<String>(['definitions', d, 'properties', p, 'value']);

            properties.add(MapEntry(property ?? '', value ?? ''));
          }

          final child = source.child(['definitions', d, 'child']);
          definitions.add(
            VariantDefinition(
              properties: Map.fromEntries(properties),
              child: child,
            ),
          );
        }
        final values = <MapEntry<String, String>>[];
        final valueCount = source.length(['variants']);
        for (var v = 0; v < valueCount; v++) {
          final property = source.v<String>([
            'variants',
            v,
            'name',
          ]);
          final value = source.v<String>([
            'variants',
            v,
            'value',
          ]);
          values.add(MapEntry(
            property ?? '',
            value ?? '',
          ));
        }
        return Variants(
          variants: Map.fromEntries(values),
          definitions: definitions,
        );
      },
      'ClipRRect': (BuildContext context, DataSource source) {
        return ClipRRect(
          borderRadius: ArgumentDecoders.borderRadius(
                source,
                ['borderRadius'],
              ) as BorderRadius? ??
              BorderRadius.zero,
          child: source.child(['child']),
        );
      },
      'PathView': (BuildContext context, DataSource source) {
        final geometryCount = source.length(['geometry']);
        final fillsCount = source.length(['fills']);
        final strokeCount = source.length(['strokes']);

        final geometry = [
          ...Iterable.generate(geometryCount).map((i) {
            final pathData = source.v<String>(['geometry', i, 'path']);
            final windingRule =
                source.v<String>(['geometry', i, 'windingRule']);
            return parseSvgPathData(pathData ?? '');
          })
        ];

        final fills = [
          for (var i = 0; i < fillsCount; i++)
            ArgumentDecoders.color(source, ['fills', i])!,
        ];

        final strokes = [
          for (var i = 0; i < strokeCount; i++)
            ArgumentDecoders.borderSide(source, ['strokes', i])!,
        ];

        return PathView(
          geometry: geometry,
          fills: fills,
          strokes: strokes,
        );
      },
      'DecoratedBorder': (BuildContext context, DataSource source) {
        return Container(
          decoration:
              _ArgumentDecoders.borderDecoration(source, ['decoration']),
          child: source.optionalChild(['child']),
        );
      },
      'BackdropFilter': (BuildContext context, DataSource source) {
        return BackdropFilter(
          filter: _ArgumentDecoders.imageFilter(source, ['filter']) ??
              ImageFilter.blur(),
          child: source.optionalChild(['child']),
        );
      },
    };

abstract class _ArgumentDecoders {
  static ImageFilter? imageFilter(DataSource source, List<Object> key) {
    if (!source.isMap(key)) {
      return null;
    }
    final String? type = source.v<String>([...key, 'type']);
    switch (type) {
      case 'blur':
        final double sigmaX = source.v<double>([...key, 'sigmaX']) ?? 0.0;
        final double sigmaY = source.v<double>([...key, 'sigmaY']) ?? 0.0;
        final TileMode tileMode = ArgumentDecoders.enumValue<TileMode>(
                TileMode.values, source, [...key, 'tileMode']) ??
            TileMode.clamp;
        return ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
          tileMode: tileMode,
        );
      default:
        return null;
    }
  }

  static Decoration? borderDecoration(DataSource source, List<Object> key) {
    return BoxDecoration(
      color: ArgumentDecoders.color(source, [...key, 'color']),
      border: border(source, [...key, 'border']),
      borderRadius: borderRadius(source, [...key, 'borderRadius']),
      gradient: ArgumentDecoders.gradient(source, [...key, 'gradient']),
    );
  }

  static BoxBorder? border(DataSource source, List<Object> key) {
    final BorderSide? a = borderSide(source, [...key, 0]);
    if (a == null) {
      return null;
    }
    final BorderSide? b = borderSide(source, [...key, 1]);
    final BorderSide? c = borderSide(source, [...key, 2]);
    final BorderSide? d = borderSide(source, [...key, 3]);
    return Border(
      left: a,
      top: b ?? a,
      right: c ?? a,
      bottom: d ?? b ?? a,
    );
  }

  static BorderSide? borderSide(DataSource source, List<Object> key) {
    if (!source.isMap(key)) {
      return null;
    }
    return BorderSide(
      color: ArgumentDecoders.color(source, [...key, 'color']) ??
          const Color(0xFF000000),
      width: source.v<double>([...key, 'width']) ?? 1.0,
      style: ArgumentDecoders.enumValue<BorderStyle>(
              BorderStyle.values, source, [...key, 'style']) ??
          BorderStyle.solid,
    );
  }

  static BorderRadiusGeometry? borderRadius(
      DataSource source, List<Object> key) {
    final Radius? a = ArgumentDecoders.radius(source, [...key, 0]);
    if (a == null) {
      return null;
    }
    final Radius? b = ArgumentDecoders.radius(source, [...key, 1]);
    final Radius? c = ArgumentDecoders.radius(source, [...key, 2]);
    final Radius? d = ArgumentDecoders.radius(source, [...key, 3]);
    return BorderRadius.only(
      topLeft: a,
      topRight: b ?? a,
      bottomLeft: c ?? a,
      bottomRight: d ?? b ?? a,
    );
  }
}
/*

  'FittedBox': (BuildContext context, DataSource source) {
    return FittedBox(
      fit: ArgumentDecoders.enumValue<BoxFit>(BoxFit.values, source, ['fit']) ?? BoxFit.contain,
      alignment: ArgumentDecoders.alignment(source, ['alignment']) ?? Alignment.center,
      clipBehavior: ArgumentDecoders.enumValue<Clip>(Clip.values, source, ['clipBehavior']) ?? Clip.none,
      child: source.optionalChild(['child']),
    );
  },
  */
