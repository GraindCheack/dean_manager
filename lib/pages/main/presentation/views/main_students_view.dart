import 'package:dean_manager/common/presentation/custom_search/custom_input.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_students_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainStudentsView extends GetView<MainStudentsController> {
  const MainStudentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        final students = state ?? [];
        return Column(
          children: [
            CustomInput(
              suffix: const Icon(Icons.search),
              onChanged: controller.searchChange,
            ),
            const DeanOffset.vertical(),
            ...students.map((e) => Text(e.shortName)).toList(),
          ],
        );
      },
    );
  }
}
