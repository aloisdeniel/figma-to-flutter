import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'options.g.dart';

@CopyWith()
class DartGeneratorOptions extends Equatable {
  const DartGeneratorOptions({
    this.global = const DartGeneratorGlobalOptions(),
    this.theme = const DartGeneratorThemeOptions(),
    this.data = const DartGeneratorDataOptions(),
  });

  final DartGeneratorGlobalOptions global;
  final DartGeneratorThemeOptions theme;
  final DartGeneratorDataOptions data;

  @override
  List<Object?> get props => [
        global,
        theme,
        data,
      ];
}

@CopyWith()
class DartGeneratorGlobalOptions extends Equatable {
  const DartGeneratorGlobalOptions({
    this.forceHugTextHeight = false,
    this.preciseCornerSmoothing = false,
  });

  /// All text with fixed height will now have a dynamic height.
  final bool forceHugTextHeight;

  /// Allows to have corner smmothing by using `figma_squircle` dependency.
  ///
  /// If disabled, then `ContinuousRectangleBorder` is used when corner smoothing is enabled.
  final bool preciseCornerSmoothing;

  @override
  List<Object?> get props => [
        forceHugTextHeight,
        preciseCornerSmoothing,
      ];
}

@CopyWith()
class DartGeneratorDataOptions {
  const DartGeneratorDataOptions({
    this.text = true,
  });

  /// Generate text resources as external classes.
  ///
  /// If disabled, text is inlined in widget's code.
  final bool text;
}

@CopyWith()
class DartGeneratorThemeOptions extends Equatable {
  const DartGeneratorThemeOptions({
    this.color = true,
    this.textStyle = true,
    this.borderRadius = true,
    this.spacing = true,
  });

  /// Generate color resources as part of the theme.
  ///
  /// If disabled, colors are inlined in widget's code.
  final bool color;

  /// Generate text style resources as part of the theme.
  ///
  /// If disabled, text styles are inlined in widget's code.
  final bool textStyle;

  /// Generate border radius resources as part of the theme.
  ///
  /// If disabled, border radiuses are inlined in widget's code.
  final bool borderRadius;

  /// Generate spacing resources as part of the theme.
  ///
  /// If disabled, spacing values are inlined in widget's code.
  final bool spacing;

  @override
  List<Object?> get props => [
        color,
        textStyle,
        borderRadius,
        spacing,
      ];
}
