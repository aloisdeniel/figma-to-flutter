import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';

@freezed
class AppAdaptativeData with _$AppAdaptativeData {
  const factory AppAdaptativeData({
    required AppAdaptativeSize size,
  }) = _AppAdaptativeData;

  factory AppAdaptativeData.fallback(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return AppAdaptativeData(
      size: mediaQuery.size.width > 500
          ? AppAdaptativeSize.large
          : AppAdaptativeSize.small,
    );
  }
}

enum AppAdaptativeSize {
  small,
  large,
}
