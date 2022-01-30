import 'package:dean_manager/common/constants/common_constants.dart';
import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:dean_manager/common/presentation/group_form/group_form.dart';
import 'package:dean_manager/common/services/db_service.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_filter_controller.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class MainGroupsController extends GetxController
    implements IMainFilterController<GroupHive> {
  MainGroupsController({required this.mainController});

  final MainController mainController;
  final TextEditingController filterController = TextEditingController();

  @override
  GroupHive? selected;
  @override
  RxList<GroupHive> list = <GroupHive>[].obs;
  @override
  RxString filter = ''.obs;
  @override
  RxBool hidden = false.obs;

  @override
  void onInit() {
    mainController.updateGroups();
    subscribe();
    super.onInit();
  }

  void subscribe() {
    mainController.groups.listen(
      (groups) => list(filterGroups(groups, mainController.selected.value)),
    );
    mainController.selected.stream.listen((value) {
      selected = null;
      if (value is GroupHive) {
        selected = value;
      }
    });
    filter.stream
        .debounceTime(const Duration(milliseconds: debounceTime))
        .listen((_) => mainController.updateGroups());
  }

  void selectGroup(GroupHive? group) {
    if (group != null && group != selected) {
      mainController.selected(group);
      return;
    }
    mainController.selected('');
  }

  void editBtnHandler(GroupHive group, GroupHive newGroup) {
    Get.close(0);
    group.name = newGroup.name;
    group.save();
    mainController.updateGroups();
  }

  void onGroupDelete(GroupHive group) {
    group.delete();
    for (var e in group.students) {
      e.delete();
    }
    mainController.updateAll();
  }

  void formSubmitHandler(GroupHive group) {
    Get.close(0);
    Get.find<DbService>().addGroup(group);
    mainController.updateGroups();
  }

  List<GroupHive> filterGroups(List<GroupHive> groups, dynamic selected) {
    if (selected is TeacherHive) {
      final selectedTeacher = selected;
      groups = groups
          .where(
            (e) => selectedTeacher.groups.any((group) => group.name == e.name),
          )
          .toList();
    }

    if (selected is StudentHive) {
      final selectedStudent = selected;
      groups = groups
          .where(
            (e) => selectedStudent.group.name == e.name,
          )
          .toList();
    }

    groups = groups.where((e) => e.name.contains(filter)).toList();

    return groups;
  }

  @override
  void clearFilters() {
    if (selected != null) {
      selectGroup(null);
    }
    filter('');
    filterController.value = const TextEditingValue(text: '');
  }

  @override
  void addBtnHandler() {
    Get.defaultDialog(
      title: 'New student',
      content: GroupForm(onSubmit: formSubmitHandler),
    );
  }
}
