import 'package:dean_manager/common/constants/border_constants.dart';
import 'package:dean_manager/common/constants/colors_constants.dart';
import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:dean_manager/common/presentation/list_card/list_card_config.dart';
import 'package:dean_manager/common/presentation/list_card/list_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeanListCard<T> extends StatelessWidget {
  DeanListCard(
    this.text, {
    this.icon,
    this.color,
    this.hoverActionChild,
    this.onPressed,
    this.selected = false,
    this.height = ListCardConfig.height,
    this.width = ListCardConfig.width,
    Key? key,
  }) : super(key: key);

  final controller = ListCardController();
  final void Function()? onPressed;
  final Widget? hoverActionChild;
  final Icon? icon;
  final Color? color;
  final bool selected;
  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onHover: controller.changeHover,
        hoverColor: Colors.transparent,
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            InkWell(
              mouseCursor: onPressed == null ? null : SystemMouseCursors.click,
              child: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(OffsetConst.s),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusConst.s,
                  color: selected ? Colors.grey.shade100 : null,
                  border: Border.all(
                    width: BorderSizeConst.s,
                    color: selected
                        ? ColorsConst.lightAccent
                        : controller.isHover.isFalse
                            ? ColorsConst.gray
                            : ColorsConst.lightAccent,
                  ),
                ),
                child: Center(
                  child: Text(text, overflow: TextOverflow.fade, maxLines: 1),
                ),
              ),
            ),
            if (hoverActionChild != null && controller.isHover.isTrue)
              Positioned(
                right: OffsetConst.s,
                child: hoverActionChild ?? const SizedBox(),
              )
          ],
        ),
      ),
    );
  }
}
