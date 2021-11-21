import 'package:dean_manager/common/constants/border_constants.dart';
import 'package:dean_manager/common/constants/colors_constants.dart';
import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class CustomButtonConfig {
  static const double defaultHeight = 30;
  static const double defaultWidth = 40;

  static const EdgeInsets padding = EdgeInsets.symmetric(
    vertical: OffsetConst.s,
    horizontal: OffsetConst.m,
  );

  static const BoxDecoration decoration = BoxDecoration(
    borderRadius: BorderRadiusConst.s,
  );
}
