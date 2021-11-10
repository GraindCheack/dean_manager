import 'package:dean_manager/common/presentation/custom_search/custom_input.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_groups_contorller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainGroupsView extends GetView<MainGroupsController> {
  const MainGroupsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        final groups = state ?? [];
        return Column(
          children: [
            const CustomInput(suffix: Icon(Icons.search)),
            const DeanOffset.vertical(),
            ...groups.map((e) => Text(e.name)).toList()
          ],
        );
      },
    );
  }
}
