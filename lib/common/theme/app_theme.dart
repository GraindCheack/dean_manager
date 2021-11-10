import 'package:dean_manager/common/constants/colors_constants.dart';
import 'package:dean_manager/common/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData.light().copyWith(
  primaryColor: ColorsConst.primary,
  appBarTheme: const AppBarTheme(backgroundColor: ColorsConst.accentLight),
  textTheme: GoogleFonts.alegreyaTextTheme().copyWith(
    headline1: TextStylesConst.lBold,
    headline2: TextStylesConst.lBold,
    headline3: TextStylesConst.l,
    headline4: TextStylesConst.l,
    headline5: TextStylesConst.l,
    headline6: TextStylesConst.l,
    subtitle1: TextStylesConst.m,
    subtitle2: TextStylesConst.m,
    bodyText1: TextStylesConst.m,
    bodyText2: TextStylesConst.m,
    button: TextStylesConst.m,
    caption: TextStylesConst.s,
    overline: TextStylesConst.s,
  ),
);
