import 'package:dean_manager/common/presentation/custom_search/custom_input.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_groups_contorller.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_teachers_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainTeachersView extends GetView<MainTeachersController> {
  const MainTeachersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        final teachers = state ?? [];
        return Column(
          children: [
            const CustomInput(suffix: Icon(Icons.search)),
            const DeanOffset.vertical(),
            ...teachers.map((e) => Text(e.shortName)).toList()
          ],
        );
      },
    );
  }
}
