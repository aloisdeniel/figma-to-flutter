// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// FigmaThemeGenerator
// **************************************************************************

class ExampleThemeData {
  const ExampleThemeData(
      {@required this.colors,
      @required this.text,
      @required this.gradients,
      @required this.borders,
      @required this.shadows,
      @required this.radii})
      : assert(colors != null),
        assert(text != null),
        assert(gradients != null),
        assert(borders != null),
        assert(shadows != null),
        assert(radii != null);

  factory ExampleThemeData.fallback() => ExampleThemeData(
        colors: ExampleThemeColorsData.fallback(),
        text: ExampleThemeTextData.fallback(),
        gradients: ExampleThemeGradientsData.fallback(),
        borders: ExampleThemeBordersData.fallback(),
        shadows: ExampleThemeShadowsData.fallback(),
        radii: ExampleThemeRadiiData.fallback(),
      );

  final ExampleThemeColorsData colors;

  final ExampleThemeTextData text;

  final ExampleThemeGradientsData gradients;

  final ExampleThemeBordersData borders;

  final ExampleThemeShadowsData shadows;

  final ExampleThemeRadiiData radii;

  ExampleThemeData copyWith(
          {ExampleThemeColorsData colors,
          ExampleThemeTextData text,
          ExampleThemeGradientsData gradients,
          ExampleThemeBordersData borders,
          ExampleThemeShadowsData shadows,
          ExampleThemeRadiiData radii}) =>
      ExampleThemeData(
        colors: colors ?? this.colors,
        text: text ?? this.text,
        gradients: gradients ?? this.gradients,
        borders: borders ?? this.borders,
        shadows: shadows ?? this.shadows,
        radii: radii ?? this.radii,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeData &&
          colors == other.colors &&
          text == other.text &&
          gradients == other.gradients &&
          borders == other.borders &&
          shadows == other.shadows &&
          radii == other.radii);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(colors) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(gradients) ^
      const DeepCollectionEquality().hash(borders) ^
      const DeepCollectionEquality().hash(shadows) ^
      const DeepCollectionEquality().hash(radii);
}

class ExampleThemeColorsData {
  const ExampleThemeColorsData(
      {@required this.red,
      @required this.blue,
      @required this.green,
      @required this.black})
      : assert(red != null),
        assert(blue != null),
        assert(green != null),
        assert(black != null);

  factory ExampleThemeColorsData.fallback() => const ExampleThemeColorsData(
        red: Color.fromARGB(255, 255, 93, 93),
        blue: Color.fromARGB(255, 108, 128, 230),
        green: Color.fromARGB(255, 108, 230, 157),
        black: Color.fromARGB(255, 35, 35, 35),
      );

  final Color red;

  final Color blue;

  final Color green;

  final Color black;

  ExampleThemeColorsData copyWith(
          {Color red, Color blue, Color green, Color black}) =>
      ExampleThemeColorsData(
        red: red ?? this.red,
        blue: blue ?? this.blue,
        green: green ?? this.green,
        black: black ?? this.black,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeColorsData &&
          red == other.red &&
          blue == other.blue &&
          green == other.green &&
          black == other.black);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(red) ^
      const DeepCollectionEquality().hash(blue) ^
      const DeepCollectionEquality().hash(green) ^
      const DeepCollectionEquality().hash(black);
}

class ExampleThemeTextData {
  const ExampleThemeTextData(
      {@required this.title, @required this.subtitle, @required this.paragraph})
      : assert(title != null),
        assert(subtitle != null),
        assert(paragraph != null);

  factory ExampleThemeTextData.fallback() => const ExampleThemeTextData(
        title: TextStyle(
          fontFamily: 'Menlo',
          fontSize: 32.00,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 108, 128, 230),
        ),
        subtitle: TextStyle(
          fontFamily: 'Menlo',
          fontSize: 20.00,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 255, 93, 93),
        ),
        paragraph: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 12.00,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 35, 35, 35),
        ),
      );

  final TextStyle title;

  final TextStyle subtitle;

  final TextStyle paragraph;

  ExampleThemeTextData copyWith(
          {TextStyle title, TextStyle subtitle, TextStyle paragraph}) =>
      ExampleThemeTextData(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        paragraph: paragraph ?? this.paragraph,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeTextData &&
          title == other.title &&
          subtitle == other.subtitle &&
          paragraph == other.paragraph);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(subtitle) ^
      const DeepCollectionEquality().hash(paragraph);
}

class ExampleThemeGradientsData {
  const ExampleThemeGradientsData({@required this.gradient})
      : assert(gradient != null);

  factory ExampleThemeGradientsData.fallback() =>
      const ExampleThemeGradientsData(
        gradient: LinearGradient(
          begin: Alignment(-1.00, -1.00),
          end: Alignment(0.79, 1.00),
          stops: [
            0.00,
            1.00,
          ],
          colors: [
            Color.fromARGB(255, 117, 63, 206),
            Color.fromARGB(255, 255, 100, 100),
          ],
          tileMode: TileMode.clamp,
        ),
      );

  final LinearGradient gradient;

  ExampleThemeGradientsData copyWith({LinearGradient gradient}) =>
      ExampleThemeGradientsData(
        gradient: gradient ?? this.gradient,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeGradientsData && gradient == other.gradient);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gradient);
}

class ExampleThemeBordersData {
  const ExampleThemeBordersData({@required this.blue}) : assert(blue != null);

  factory ExampleThemeBordersData.fallback() => const ExampleThemeBordersData(
        blue: BorderSide(
          style: BorderStyle.solid,
          width: 6.00,
          color: Color.fromARGB(255, 108, 128, 230),
        ),
      );

  final BorderSide blue;

  ExampleThemeBordersData copyWith({BorderSide blue}) =>
      ExampleThemeBordersData(
        blue: blue ?? this.blue,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeBordersData && blue == other.blue);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(blue);
}

class ExampleThemeShadowsData {
  const ExampleThemeShadowsData({@required this.drop}) : assert(drop != null);

  factory ExampleThemeShadowsData.fallback() => const ExampleThemeShadowsData(
        drop: BoxShadow(
          color: Color.fromARGB(63, 0, 0, 0),
          blurRadius: 7.0,
          offset: Offset(6.0, 7.0),
        ),
      );

  final BoxShadow drop;

  ExampleThemeShadowsData copyWith({BoxShadow drop}) => ExampleThemeShadowsData(
        drop: drop ?? this.drop,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeShadowsData && drop == other.drop);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(drop);
}

class ExampleThemeRadiiData {
  const ExampleThemeRadiiData({@required this.blue}) : assert(blue != null);

  factory ExampleThemeRadiiData.fallback() => ExampleThemeRadiiData(
        blue: BorderRadius.circular(7.00),
      );

  final BorderRadius blue;

  ExampleThemeRadiiData copyWith({BorderRadius blue}) => ExampleThemeRadiiData(
        blue: blue ?? this.blue,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeRadiiData && blue == other.blue);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(blue);
}
