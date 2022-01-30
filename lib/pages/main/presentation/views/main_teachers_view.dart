import 'package:dean_manager/common/constants/size_constants.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:dean_manager/common/presentation/custom_button/custom_button.dart';
import 'package:dean_manager/common/presentation/custom_input/custom_input.dart';
import 'package:dean_manager/common/presentation/list_card/list_card_view.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:dean_manager/common/presentation/teachers_form/teachers_form.dart';
import 'package:dean_manager/common/services/db_service.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_teachers_controller.dart';
import 'package:dean_manager/pages/main/presentation/views/common/main_filter_actions.dart';
import 'package:dean_manager/pages/main/presentation/views/common/main_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainTeachersView extends GetView<MainTeachersController> {
  const MainTeachersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: CustomInput(
                    controller: controller.filterController,
                    onChanged: (value) => controller.filter(value),
                    suffix: const Icon(Icons.search),
                    title: 'Teachers',
                  ),
                ),
                const DeanOffset.horizontal(),
                MainFilterActions(controller: controller),
              ],
            ),
          ),
          const DeanOffset.vertical(),
          if (controller.hidden.isFalse)
            ...controller.list
                .map(
                  (e) => Column(
                    children: [
                      MainListCard<TeacherHive>(
                        e.shortName,
                        object: e,
                        selected: controller.selected?.fullName == e.fullName,
                        onPressed: (teacher) {
                          if (teacher != null) {
                            controller.selectTeacher(teacher);
                          }
                        },
                        onEdit: (group) {
                          if (group != null) {
                            Get.defaultDialog(
                              title: 'Edit teacher',
                              content: TeacherForm(
                                teacher: e,
                                onSubmit: (group) => controller.editBtnHandler(e, group),
                              ),
                            );
                          }
                        },
                        onDelete: (group) {
                          if (group != null) {
                            controller.onGroupDelete(group);
                          }
                        },
                      ),
                      const DeanOffset.vertical()
                    ],
                  ),
                )
                .toList(),
        ],
      ),
    );
  }
}
