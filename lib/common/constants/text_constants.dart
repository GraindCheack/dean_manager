import 'package:dean_manager/common/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

abstract class FontSizeConst {
  static const double m = 16;
  static const double l = m * 2;
  static const double s = m * 0.8;
}

abstract class TextStylesConst {
  static final m = defaultFont.copyWith(fontSize: FontSizeConst.m);
  static final l = defaultFont.copyWith(fontSize: FontSizeConst.l);
  static final s = defaultFont.copyWith(fontSize: FontSizeConst.s);
  static final lBold = defaultFont.copyWith(
    fontSize: FontSizeConst.m,
    fontWeight: FontWeight.w600,
  );
}
