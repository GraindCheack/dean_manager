import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/presentation/custom_search/custom_input.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:dean_manager/common/presentation/student_form/student_form.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_students_controller.dart';
import 'package:dean_manager/pages/main/presentation/views/common/main_filter_actions.dart';
import 'package:dean_manager/pages/main/presentation/views/common/main_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainStudentsView extends GetView<MainStudentsController> {
  const MainStudentsView({Key? key}) : super(key: key);

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
                    title: 'Students',
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
                      MainListCard<StudentHive>(
                        e.shortName,
                        object: e,
                        selected: controller.selected?.fullName == e.fullName,
                        onPressed: (student) {
                          if (student != null) {
                            controller.selectStudent(student);
                          }
                        },
                        onEdit: (group) {
                          if (group != null) {
                            Get.defaultDialog(
                              title: 'Edit student',
                              content: StudentForm(
                                student: e,
                                onSubmit: (group) =>
                                    controller.editBtnHandler(e, group),
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
