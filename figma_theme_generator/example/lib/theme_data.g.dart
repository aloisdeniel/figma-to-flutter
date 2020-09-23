import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';

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
        colors: ExampleColorThemeData.fallback(),
        text: ExampleTextThemeData.fallback(),
        gradients: ExampleGradientThemeData.fallback(),
        shadows: ExampleShadowThemeData.fallback(),
      );

  final ExampleColorThemeData colors;

  final ExampleTextThemeData text;

  final ExampleGradientThemeData gradients;

  final ExampleShadowThemeData shadows;

  ExampleThemeData copyWith(
          {ExampleColorThemeData colors,
          ExampleTextThemeData text,
          ExampleGradientThemeData gradients,
          ExampleShadowThemeData shadows}) =>
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

class ExampleColorThemeData {
  const ExampleColorThemeData(
      {@required this.red,
      @required this.blue,
      @required this.green,
      @required this.black})
      : assert(red != null),
        assert(blue != null),
        assert(green != null),
        assert(black != null);

  factory ExampleColorThemeData.fallback() => const ExampleColorThemeData(
        red: Color.fromARGB(255, 255, 93, 93),
        blue: Color.fromARGB(255, 108, 128, 230),
        green: Color.fromARGB(255, 108, 230, 157),
        black: Color.fromARGB(255, 35, 35, 35),
      );

  final Color red;

  final Color blue;

  final Color green;

  final Color black;

  ExampleColorThemeData copyWith(
          {Color red, Color blue, Color green, Color black}) =>
      ExampleColorThemeData(
        red: red ?? this.red,
        blue: blue ?? this.blue,
        green: green ?? this.green,
        black: black ?? this.black,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleColorThemeData &&
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

class ExampleTextThemeData {
  const ExampleTextThemeData(
      {@required this.title, @required this.subtitle, @required this.paragraph})
      : assert(title != null),
        assert(subtitle != null),
        assert(paragraph != null);

  factory ExampleTextThemeData.fallback() => const ExampleTextThemeData(
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

  ExampleTextThemeData copyWith(
          {TextStyle title, TextStyle subtitle, TextStyle paragraph}) =>
      ExampleTextThemeData(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        paragraph: paragraph ?? this.paragraph,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleTextThemeData &&
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

class ExampleGradientThemeData {
  const ExampleGradientThemeData({@required this.gradient})
      : assert(gradient != null);

  factory ExampleGradientThemeData.fallback() => const ExampleGradientThemeData(
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

  ExampleGradientThemeData copyWith({LinearGradient gradient}) =>
      ExampleGradientThemeData(
        gradient: gradient ?? this.gradient,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleGradientThemeData && gradient == other.gradient);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(gradient);
}

class ExampleShadowThemeData {
  const ExampleShadowThemeData({@required this.drop}) : assert(drop != null);

  factory ExampleShadowThemeData.fallback() => const ExampleShadowThemeData(
        drop: BoxShadow(
          color: Color.fromARGB(63, 0, 0, 0),
          blurRadius: 7,
          offset: Offset(6, 7),
          spreadRadius: 7,
        ),
      );

  final BoxShadow drop;

  ExampleShadowThemeData copyWith({BoxShadow drop}) => ExampleShadowThemeData(
        drop: drop ?? this.drop,
      );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleShadowThemeData && drop == other.drop);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(drop);
}
