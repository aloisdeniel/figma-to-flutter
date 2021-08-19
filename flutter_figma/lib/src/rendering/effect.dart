import 'package:flutter/widgets.dart';
import 'package:figma/figma.dart' as figma;
import '../helpers/api_extensions.dart';

abstract class FigmaEffect {
  const FigmaEffect();

  factory FigmaEffect.api(figma.Effect effect) {
    if (effect.type == figma.EffectType.dropShadow) {
      return FigmaDropShadowEffect(
        color: effect.color?.toFlutterColor(),
        offset: effect.offset.toOffset(),
        radius: effect.radius?.toDouble() ?? 0.0,
      );
    }
    if (effect.type == figma.EffectType.backgroundBlur) {
      return FigmaBackgroundBlurEffect(
        radius: effect.radius?.toDouble() ?? 0.0,
      );
    }

    return const FigmaBackgroundBlurEffect();
  }
}

class FigmaDropShadowEffect extends FigmaEffect {
  final Color? color;
  final Offset? offset;
  final double? radius;
  const FigmaDropShadowEffect({
    this.color,
    this.offset,
    this.radius,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaDropShadowEffect &&
        color != other.color &&
        offset != other.offset &&
        radius != other.radius;
  }

  @override
  int get hashCode {
    return (color.hashCode ^ offset.hashCode ^ radius.hashCode);
  }
}

class FigmaBackgroundBlurEffect extends FigmaEffect {
  final double radius;
  const FigmaBackgroundBlurEffect({
    this.radius = 0.0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaBackgroundBlurEffect && radius != other.radius;
  }

  @override
  int get hashCode {
    return (radius.hashCode);
  }
}
