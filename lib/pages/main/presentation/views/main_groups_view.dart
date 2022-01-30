import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/presentation/custom_search/custom_input.dart';
import 'package:dean_manager/common/presentation/group_form/group_form.dart';
import 'package:dean_manager/common/presentation/offset/offset.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_groups_contorller.dart';
import 'package:dean_manager/pages/main/presentation/views/common/main_filter_actions.dart';
import 'package:dean_manager/pages/main/presentation/views/common/main_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainGroupsView extends GetView<MainGroupsController> {
  const MainGroupsView({Key? key}) : super(key: key);

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
                    title: 'Groups',
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
                      MainListCard<GroupHive>(
                        e.name,
                        object: e,
                        selected: controller.selected?.name == e.name,
                        onPressed: (group) {
                          if (group != null) {
                            controller.selectGroup(group);
                          }
                        },
                        onEdit: (group) {
                          if (group != null) {
                            Get.defaultDialog(
                              title: 'Edit group',
                              content: GroupForm(
                                group: e,
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
                      const DeanOffset.vertical(),
                    ],
                  ),
                )
                .toList(),
        ],
      ),
    );
  }
}
