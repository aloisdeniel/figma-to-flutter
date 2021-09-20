import 'package:flutter_figma_generator/src/code_builders/resources/resource/paint.dart';
import 'package:flutter_figma_generator/src/code_builders/resources/resource/radius.dart';
import 'package:flutter_figma_generator/src/code_builders/resources/resource/spacing.dart';

import 'resource/color.dart';

import 'package:figma/figma.dart' as figma;

import 'resource/resource.dart';
import 'resource/text_style.dart';

class Resources {
  Resources();
  final Map<String, Map<String, Resource>> _ressources = {};

  static const colorKey = 'color';
  static const textKey = 'text';
  static const radiusKey = 'radius';
  static const paintKey = 'paint';
  static const spacingKey = 'spacing';

  /// Registers a new color.
  ///
  /// If a resource with the same value has already been registered, then
  /// the existing resource is returned instead.
  Resource addColor(
    figma.Color color, {
    double opacity = 1.0,
    String? name,
  }) {
    return _createOrGet(
      colorKey,
      name,
      (name) => ColorResource.fromFigma(
        name: name,
        color: color,
      ),
    );
  }

  /// Registers a new radius.
  ///
  /// If a resource with the same value has already been registered, then
  /// the existing resource is returned instead.
  Resource addRadius(
    num value, {
    String? name,
  }) {
    return _createOrGet(
      radiusKey,
      name,
      (name) => RadiusResource.fromFigma(
        name: name,
        value: value,
      ),
    );
  }

  /// Registers a new spacing.
  ///
  /// If a resource with the same value has already been registered, then
  /// the existing resource is returned instead.
  Resource addSpacing(
    num value, {
    String? name,
  }) {
    return _createOrGet(
      spacingKey,
      name,
      (name) => SpacingResource.fromFigma(
        name: name,
        value: value,
      ),
    );
  }

  /// Registers a text style.
  ///
  /// If a resource with the same value has already been registered, then
  /// the existing resource is returned instead.
  Resource addTextStyle(
    figma.TypeStyle style, {
    String? name,
    required figma.Color color,
    String? package,
  }) {
    final colorResource =
        addColor(color, name: name == null ? 'textColor' : '${name}Color');
    return _createOrGet(
      textKey,
      name,
      (name) => TextStyleResource.fromFigma(
        name: name,
        style: style,
        color: colorResource,
        package: package,
      ),
    );
  }

  /// Registers a text style.
  ///
  /// If a resource with the same value has already been registered, then
  /// the existing resource is returned instead.
  Resource addPaint(
    figma.Paint paint, {
    required figma.Color color,
    required List<figma.Color> gradientColors,
    String? name,
  }) {
    final colorResource =
        addColor(color, name: name == null ? 'paintColor' : '${name}Color');

    final gradientColorResources = gradientColors
        .map(
          (color) => addColor(
            color,
            name: name == null ? 'paintGradientColor' : '${name}Color',
          ),
        )
        .toList();
    return _createOrGet(
      textKey,
      name,
      (name) => PaintResource.fromFigma(
        name: name,
        paint: paint,
        color: colorResource,
        gradientColors: gradientColorResources,
      ),
    );
  }

  Resource _createOrGet(String key, String? name, Resource build(String name)) {
    final resName = _createResourceName(key, name);
    final newResource = build(resName);
    final resources = _ressources.putIfAbsent(
      key,
      () => <String, Resource>{},
    );
    final resource = resources.entries.firstWhere(
      (entry) => entry.value.instance == newResource.instance,
      orElse: () {
        resources[newResource.name] = newResource;
        return MapEntry(resName, newResource);
      },
    );
    return resource.value;
  }

  String _createResourceName(String key, String? name) {
    final baseName = name ?? key;
    var result = baseName;
    final existing = _ressources[key]!;
    int i = 1;
    while (existing.containsKey(result)) {
      result = '$baseName$i';
      i++;
    }
    return result;
  }
}
