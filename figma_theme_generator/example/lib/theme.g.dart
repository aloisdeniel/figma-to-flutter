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
      @required this.shadows})
      : assert(colors != null),
        assert(text != null),
        assert(gradients != null),
        assert(shadows != null);

  factory ExampleThemeData.fallback() => ExampleThemeData(
        colors: ExampleThemeColorData.fallback(),
        text: ExampleThemeTextData.fallback(),
        gradients: ExampleThemeGradientData.fallback(),
        shadows: ExampleThemeShadowData.fallback(),
      );

  final ExampleThemeColorData colors;

  final ExampleThemeTextData text;

  final ExampleThemeGradientData gradients;

  final ExampleThemeShadowData shadows;

  ExampleThemeData copyWith(
          {ExampleThemeColorData colors,
          ExampleThemeTextData text,
          ExampleThemeGradientData gradients,
          ExampleThemeShadowData shadows}) =>
      ExampleThemeData(
        colors: colors ?? this.colors,
        text: text ?? this.text,
        gradients: gradients ?? this.gradients,
        shadows: shadows ?? this.shadows,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeData &&
          colors == other.colors &&
          text == other.text &&
          gradients == other.gradients &&
          shadows == other.shadows);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(colors) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(gradients) ^
      const DeepCollectionEquality().hash(shadows);
}

class ExampleThemeColorData {
  const ExampleThemeColorData(
      {@required this.red,
      @required this.blue,
      @required this.green,
      @required this.black})
      : assert(red != null),
        assert(blue != null),
        assert(green != null),
        assert(black != null);

  factory ExampleThemeColorData.fallback() => const ExampleThemeColorData(
        red: Color.fromARGB(255, 255, 93, 93),
        blue: Color.fromARGB(255, 108, 128, 230),
        green: Color.fromARGB(255, 108, 230, 157),
        black: Color.fromARGB(255, 35, 35, 35),
      );

  final Color red;

  final Color blue;

  final Color green;

  final Color black;

  ExampleThemeColorData copyWith(
          {Color red, Color blue, Color green, Color black}) =>
      ExampleThemeColorData(
        red: red ?? this.red,
        blue: blue ?? this.blue,
        green: green ?? this.green,
        black: black ?? this.black,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeColorData &&
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

class ExampleThemeGradientData {
  const ExampleThemeGradientData({@required this.gradient})
      : assert(gradient != null);

  factory ExampleThemeGradientData.fallback() => const ExampleThemeGradientData(
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

  ExampleThemeGradientData copyWith({LinearGradient gradient}) =>
      ExampleThemeGradientData(
        gradient: gradient ?? this.gradient,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeGradientData && gradient == other.gradient);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gradient);
}

class ExampleThemeShadowData {
  const ExampleThemeShadowData({@required this.drop}) : assert(drop != null);

  factory ExampleThemeShadowData.fallback() => const ExampleThemeShadowData(
        drop: BoxShadow(
          color: Color.fromARGB(63, 0, 0, 0),
          blurRadius: 7.0,
          offset: Offset(6.0, 7.0),
          spreadRadius: 0.0,
        ),
      );

  final BoxShadow drop;

  ExampleThemeShadowData copyWith({BoxShadow drop}) => ExampleThemeShadowData(
        drop: drop ?? this.drop,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleThemeShadowData && drop == other.drop);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(drop);
}
