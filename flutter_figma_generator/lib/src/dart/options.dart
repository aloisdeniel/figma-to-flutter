class DartGeneratorOptions {
  const DartGeneratorOptions({
    this.global = const DartGeneratorGlobalOptions(),
    this.theme = const DartGeneratorThemeOptions(),
  });

  final DartGeneratorGlobalOptions global;
  final DartGeneratorThemeOptions theme;
}

class DartGeneratorGlobalOptions {
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
}

class DartGeneratorDataOptions {
  const DartGeneratorDataOptions({
    this.text = true,
  });

  /// Generate text resources as external classes.
  ///
  /// If disabled, text is inlined in widget's code.
  final bool text;
}

class DartGeneratorThemeOptions {
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
}
