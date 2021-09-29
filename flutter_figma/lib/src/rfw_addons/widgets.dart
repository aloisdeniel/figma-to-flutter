import 'dart:ui';

import 'package:flutter_figma/src/rfw_addons/path_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:path_parsing/path_parsing.dart';
import 'package:rfw/flutter/argument_decoders.dart';
import 'package:rfw/rfw.dart';

typedef ComponentRenderer = Widget Function(
  Widget Function() render,
  String name,
  Map<String, String> variants,
  String instanceName,
);

LocalWidgetLibrary createCoreAddonsWidgets([ComponentRenderer? renderer]) {
  return LocalWidgetLibrary(_coreWidgetsDefinitions(((Widget Function() render,
      String name, Map<String, String> variants, String instanceName) {
    if (renderer != null) return renderer(render, name, variants, instanceName);
    return render();
  })));
}

Map<String, LocalWidgetBuilder> _coreWidgetsDefinitions(
        ComponentRenderer renderer) =>
    <String, LocalWidgetBuilder>{
      'ComponentRenderer': (BuildContext context, DataSource source) {
        final name = source.v<String>(['name']);
        final instanceName = source.v<String>(['instanceName']);
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
        return renderer(
          () => source.child(['child']),
          name ?? '',
          Map.fromEntries(values),
          instanceName ?? '',
        );
      },
      'ClipRRect': (BuildContext context, DataSource source) {
        var borderRadius = ArgumentDecoders.borderRadius(
          source,
          ['borderRadius'],
        );

        if (borderRadius is BorderRadiusDirectional) {
          borderRadius = borderRadius.resolve(Directionality.of(context));
        }
        return ClipRRect(
          borderRadius: borderRadius as BorderRadius? ?? BorderRadius.zero,
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
            return Geometry(pathData ?? '', windingRule: windingRule);
          })
        ];

        final fills = [
          for (var i = 0; i < fillsCount; i++)
            _ArgumentDecoders.smoothDecoration(source, ['fills', i])!,
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
      'SmoothContainer': (BuildContext context, DataSource source) {
        return Container(
          decoration:
              _ArgumentDecoders.smoothDecoration(source, ['decoration']),
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

  static Decoration? smoothDecoration(DataSource source, List<Object> key) {
    final shape = smoothBorder(source, [...key, 'shape']);
    final color = ArgumentDecoders.color(source, [...key, 'color']);
    final gradient = ArgumentDecoders.gradient(source, [...key, 'gradient']);
    final image = ArgumentDecoders.decorationImage(source, [...key, 'image']);
    if (shape == null) {
      return BoxDecoration(
        color: color,
        gradient: gradient,
      );
    }
    return ShapeDecoration(
      color: color,
      gradient: gradient,
      shape: shape,
      image: image,
    );
  }

  static ShapeBorder? smoothBorder(DataSource source, List<Object> key) {
    final BorderSide? side = borderSide(source, [...key, 'side']);
    final borderRadius = _ArgumentDecoders.smoothBorderRadius(
            source, [...key, 'borderRadius']) ??
        SmoothBorderRadius.zero;
    final borderAlign = ArgumentDecoders.enumValue<BorderAlign>(
          BorderAlign.values,
          source,
          [...key, 'borderAlign'],
        ) ??
        BorderAlign.inside;

    return SmoothRectangleBorder(
      side: side ?? BorderSide.none,
      borderRadius: borderRadius,
      borderAlign: borderAlign,
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

  static SmoothBorderRadius? smoothBorderRadius(
      DataSource source, List<Object> key) {
    final a = smoothRadius(source, [...key, 0]);
    if (a == null) {
      return null;
    }
    final b = smoothRadius(source, [...key, 1]);
    final c = smoothRadius(source, [...key, 2]);
    final d = smoothRadius(source, [...key, 3]);
    return SmoothBorderRadius.only(
      topLeft: a,
      topRight: b ?? a,
      bottomLeft: c ?? a,
      bottomRight: d ?? b ?? a,
    );
  }

  static SmoothRadius? smoothRadius(DataSource source, List<Object> key) {
    final double? radius = source.v<double>([...key, 'x']);
    if (radius == null) {
      return null;
    }
    final double smoothing = source.v<double>([...key, 'smoothing']) ?? 0.0;
    return SmoothRadius(
      cornerRadius: radius,
      cornerSmoothing: smoothing,
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
