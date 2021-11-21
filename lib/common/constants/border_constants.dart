import 'package:flutter/widgets.dart';

abstract class BorderRadiusConst {
  static const m = BorderRadius.all(Radius.circular(10));
  static const l = BorderRadius.all(Radius.circular(14));
  static const s = BorderRadius.all(Radius.circular(6));

  static BorderRadius getCircleRadius(double parentRadius) => BorderRadius.all(
        Radius.circular(parentRadius / 2),
      );
}
