import 'package:dean_manager/common/constants/colors_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FontSizeConst {
  static const double m = 16;
  static const double l = m * 2;
  static const double s = m * 0.8;
}

abstract class TextStylesConst {
  static final m = GoogleFonts.alegreya(
    fontSize: FontSizeConst.m,
    color: ColorsConst.primary,
    decoration: TextDecoration.none,
  );
  static final l = GoogleFonts.alegreya(
    fontSize: FontSizeConst.l,
    color: ColorsConst.primary,
    decoration: TextDecoration.none,
  );
  static final s = GoogleFonts.alegreya(
    fontSize: FontSizeConst.s,
    color: ColorsConst.primary,
    decoration: TextDecoration.none,
  );
  static final lBold = GoogleFonts.alegreya(
    fontSize: FontSizeConst.m,
    fontWeight: FontWeight.w600,
    color: ColorsConst.primary,
    decoration: TextDecoration.none,
  );
}
