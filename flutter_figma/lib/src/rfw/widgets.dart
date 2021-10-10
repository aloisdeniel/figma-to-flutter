import 'dart:ui';

import 'package:flutter_figma/src/widgets/path_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:rfw/rfw.dart';

typedef InstanceRenderer = Widget Function(
  Widget Function() render,
  String name,
  Map<String, String> variants,
  String instanceName,
);

LocalWidgetLibrary createFlutterFigmaWidgets([InstanceRenderer? renderer]) {
  return LocalWidgetLibrary(_coreWidgetsDefinitions(((Widget Function() render,
      String name, Map<String, String> variants, String instanceName) {
    if (renderer != null) return renderer(render, name, variants, instanceName);
    return render();
  })));
}

Map<String, LocalWidgetBuilder> _coreWidgetsDefinitions(
        InstanceRenderer renderer) =>
    <String, LocalWidgetBuilder>{
      'Instance': (BuildContext context, DataSource source) {
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
      'Transform': (BuildContext context, DataSource source) {
        final transform = ArgumentDecoders.matrix(source, ['transform']);
        final alignment = ArgumentDecoders.alignment(source, ['alignment']);
        final origin = ArgumentDecoders.offset(source, ['origin']);
        final child = source.child(['child']);

        if (transform == null) return child;
        return Transform(
          transform: transform,
          alignment: alignment,
          origin: origin,
          child: child,
        );
      },
      'ColoredText': (BuildContext context, DataSource source) {
        String? text = source.v<String>(['text']);
        if (text == null) {
          final StringBuffer builder = StringBuffer();
          final int count = source.length(['text']);
          for (int index = 0; index < count; index += 1) {
            builder.write(source.v<String>(['text', index]) ?? '');
          }
          text = builder.toString();
        }

        var style = ArgumentDecoders.textStyle(source, ['style']);
        final color = ArgumentDecoders.color(source, ['color']);
        if (color != null) {
          style = style!.copyWith(color: color);
        }
        return Text(
          text,
          style: style,
          strutStyle: ArgumentDecoders.strutStyle(source, ['strutStyle']),
          textAlign: ArgumentDecoders.enumValue<TextAlign>(
              TextAlign.values, source, ['textAlign']),
          textDirection: ArgumentDecoders.enumValue<TextDirection>(
              TextDirection.values, source, ['textDirection']),
          locale: ArgumentDecoders.locale(source, ['locale']),
          softWrap: source.v<bool>(['softWrap']),
          overflow: ArgumentDecoders.enumValue<TextOverflow>(
              TextOverflow.values, source, ['overflow']),
          textScaleFactor: source.v<double>(['textScaleFactor']),
          maxLines: source.v<int>(['maxLines']),
          semanticsLabel: source.v<String>(['semanticsLabel']),
          textWidthBasis: ArgumentDecoders.enumValue<TextWidthBasis>(
              TextWidthBasis.values, source, ['textWidthBasis']),
          textHeightBehavior: ArgumentDecoders.textHeightBehavior(
              source, ['textHeightBehavior']),
        );
      },
      'PathView': (BuildContext context, DataSource source) {
        final geometryCount = source.length(['geometry']);
        final fillsCount = source.length(['fills']);
        final strokeCount = source.length(['strokes']);

        final geometry = [
          ...Iterable.generate(geometryCount).map((i) {
            final pathData = source.v<String>(['geometry', i, 'path']);
            final windingRule = ArgumentDecoders.enumValue<PathFillType>(
                PathFillType.values, source, ['geometry', i, 'windingRule']);
            return Geometry(
              pathData ?? '',
              windingRule: windingRule ?? PathFillType.nonZero,
            );
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
