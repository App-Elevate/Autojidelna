// This file is "main.dart"
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snack_bar_data.freezed.dart';

@freezed
class SnackBarData with _$SnackBarData {
  const factory SnackBarData({
    @JsonKey(name: 'icon_data') required IconData iconData,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'subtitle') String? subtitle,
  }) = _SnackBarData;
}
