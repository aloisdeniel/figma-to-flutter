import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';

@freezed
class AppThemeData with _$AppThemeData {
  const factory AppThemeData({
    required AppThemeColorData color,
    required AppThemeEdgeInsetsData edgeInsets,
    required AppThemeTextStyleData textStyle,
    required AppThemeBorderRadiusData borderRadius,
  }) = _AppThemeData;

  factory AppThemeData.fallback() {
    return const AppThemeData(
      color: AppThemeColorData(),
      edgeInsets: AppThemeEdgeInsetsData(),
      textStyle: AppThemeTextStyleData(),
      borderRadius: AppThemeBorderRadiusData(),
    );
  }
}

@freezed
class AppThemeColorData with _$AppThemeColorData {
  const factory AppThemeColorData({
    @Default(Color(0xFF1C1A25)) Color background1,
    @Default(Color(0xFF211F2D)) Color background2,
    @Default(Color(0xFF282536)) Color background3,
    @Default(Color(0xFFFFFFFF)) Color foreground1,
    @Default(Color(0xFF37E5A5)) Color primary1,
    @Default(Color(0xFF6AB8FF)) Color secondary1,
    @Default(Color(0xFFAE6FFF)) Color thirdary1,
  }) = _AppThemeColorData;
}

@freezed
class AppThemeEdgeInsetsData with _$AppThemeEdgeInsetsData {
  const factory AppThemeEdgeInsetsData({
    @Default(EdgeInsets.all(4)) EdgeInsets small,
    @Default(EdgeInsets.all(12)) EdgeInsets regular,
    @Default(EdgeInsets.all(24)) EdgeInsets big,
  }) = _AppThemeEdgeInsetsData;
}

@freezed
class AppThemeBorderRadiusData with _$AppThemeBorderRadiusData {
  const factory AppThemeBorderRadiusData({
    @Default(
      SmoothBorderRadius.all(
        SmoothRadius(
          cornerRadius: 2,
          cornerSmoothing: 1,
        ),
      ),
    )
        SmoothBorderRadius small,
    @Default(
      SmoothBorderRadius.all(
        SmoothRadius(
          cornerRadius: 4,
          cornerSmoothing: 1,
        ),
      ),
    )
        SmoothBorderRadius regular,
    @Default(
      SmoothBorderRadius.all(
        SmoothRadius(
          cornerRadius: 8,
          cornerSmoothing: 1,
        ),
      ),
    )
        SmoothBorderRadius big,
  }) = _AppThemeBorderRadiusData;
}

@freezed
class AppThemeTextStyleData with _$AppThemeTextStyleData {
  const factory AppThemeTextStyleData({
    @Default(
      TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w400,
      ),
    )
        TextStyle body1,
    @Default(
      TextStyle(
        fontFamily: 'Poppins',
        fontSize: 10,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w400,
      ),
    )
        TextStyle body2,
    @Default(
      TextStyle(
        fontFamily: 'Poppins',
        fontSize: 32,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w700,
      ),
    )
        TextStyle title1,
    @Default(
      TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w700,
      ),
    )
        TextStyle title2,
    @Default(
      TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w700,
      ),
    )
        TextStyle title3,
    @Default(
      TextStyle(
        fontFamily: 'Fira Code',
        fontSize: 12,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w400,
      ),
    )
        TextStyle code1,
  }) = _AppThemeTextStyleData;
}
