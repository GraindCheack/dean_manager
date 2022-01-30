import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:dean_manager/common/constants/text_constants.dart';
import 'package:flutter/material.dart';

abstract class CustomInputConfig {
  static const double height = 50;

  static InputDecoration getDecoration({String? title, Widget? suffix}) {
    return InputDecoration(
      isDense: true,
      labelStyle: TextStylesConst.m,
      contentPadding: const EdgeInsets.symmetric(
        vertical: OffsetConst.s,
        horizontal: OffsetConst.s,
      ),
      border: const OutlineInputBorder(),
      labelText: title,
      suffixIcon: suffix,
    );
  }
}
