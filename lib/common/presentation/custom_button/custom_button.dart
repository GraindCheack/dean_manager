import 'package:dean_manager/common/constants/border_constants.dart';
import 'package:dean_manager/common/constants/colors_constants.dart';
import 'package:dean_manager/common/constants/text_constants.dart';
import 'package:dean_manager/common/presentation/custom_button/custom_button_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.child,
    this.isInline = false,
    this.padding = CustomButtonConfig.padding,
    this.hoverColor,
    this.color,
    this.height,
    this.width,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final bool isInline;
  final Color? color;
  final Color? hoverColor;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return isInline ? UnconstrainedBox(child: _getButton()) : _getButton();
  }

  Widget _getButton() {
    return DefaultTextStyle(
      style: TextStylesConst.m.copyWith(color: ColorsConst.white),
      child: InkWell(
        splashColor: ColorsConst.lightBlue,
        borderRadius: BorderRadiusConst.s,
        hoverColor: hoverColor ?? ColorsConst.lightAccent,
        onTap: onPressed,
        onHover: (v) {},
        child: Ink(
          height: height,
          width: width,
          padding: padding,
          decoration: CustomButtonConfig.decoration.copyWith(
            color: color ??
                (onPressed == null ? ColorsConst.gray : ColorsConst.lightBlue),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
