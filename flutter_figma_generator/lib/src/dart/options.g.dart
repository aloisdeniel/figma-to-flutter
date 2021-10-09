// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension DartGeneratorOptionsCopyWith on DartGeneratorOptions {
  DartGeneratorOptions copyWith({
    DartGeneratorDataOptions? data,
    DartGeneratorGlobalOptions? global,
    DartGeneratorThemeOptions? theme,
  }) {
    return DartGeneratorOptions(
      data: data ?? this.data,
      global: global ?? this.global,
      theme: theme ?? this.theme,
    );
  }
}

extension DartGeneratorGlobalOptionsCopyWith on DartGeneratorGlobalOptions {
  DartGeneratorGlobalOptions copyWith({
    bool? forceHugTextHeight,
    bool? preciseCornerSmoothing,
  }) {
    return DartGeneratorGlobalOptions(
      forceHugTextHeight: forceHugTextHeight ?? this.forceHugTextHeight,
      preciseCornerSmoothing:
          preciseCornerSmoothing ?? this.preciseCornerSmoothing,
    );
  }
}

extension DartGeneratorDataOptionsCopyWith on DartGeneratorDataOptions {
  DartGeneratorDataOptions copyWith({
    bool? text,
  }) {
    return DartGeneratorDataOptions(
      text: text ?? this.text,
    );
  }
}

extension DartGeneratorThemeOptionsCopyWith on DartGeneratorThemeOptions {
  DartGeneratorThemeOptions copyWith({
    bool? borderRadius,
    bool? color,
    bool? spacing,
    bool? textStyle,
  }) {
    return DartGeneratorThemeOptions(
      borderRadius: borderRadius ?? this.borderRadius,
      color: color ?? this.color,
      spacing: spacing ?? this.spacing,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}
