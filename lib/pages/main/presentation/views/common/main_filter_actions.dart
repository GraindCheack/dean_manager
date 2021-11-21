import 'package:dean_manager/common/constants/colors_constants.dart';
import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:dean_manager/common/presentation/custom_button/custom_button.dart';
import 'package:dean_manager/common/presentation/group_form/group_form.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_filter_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFilterActions extends StatelessWidget {
  const MainFilterActions({Key? key, required this.controller})
      : super(key: key);

  final IMainFilterController controller;
  static const double _buttonsWidth = 40;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          padding: null,
          width: _buttonsWidth,
          onPressed: controller.filter.isNotEmpty || controller.selected != null
              ? controller.clearFilters
              : null,
          child: const Icon(
            Icons.close,
            size: IconSizeConst.m,
            color: ColorsConst.white,
          ),
        ),
        const DeanOffset.horizontal(OffsetConst.s),
        CustomButton(
          padding: null,
          width: _buttonsWidth,
          onPressed:
              controller.list.isNotEmpty ? controller.hidden.toggle : null,
          child: Icon(
            controller.hidden.isTrue
                ? Icons.arrow_drop_down
                : Icons.arrow_drop_up,
            size: IconSizeConst.m,
            color: ColorsConst.white,
          ),
        ),
        const DeanOffset.horizontal(OffsetConst.s),
        CustomButton(
          padding: null,
          width: _buttonsWidth,
          onPressed: controller.addBtnHandler,
          child: const Icon(
            Icons.add,
            size: IconSizeConst.m,
            color: ColorsConst.white,
          ),
        ),
      ],
    );
  }
}
