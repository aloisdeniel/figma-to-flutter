import 'dart:ui';

import 'package:figma_remote/figma_remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rfw/rfw.dart';

LocalWidgetLibrary createCoreAddonsWidgets() =>
    LocalWidgetLibrary(_coreWidgetsDefinitions);

Map<String, LocalWidgetBuilder> get _coreWidgetsDefinitions =>
    <String, LocalWidgetBuilder>{
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