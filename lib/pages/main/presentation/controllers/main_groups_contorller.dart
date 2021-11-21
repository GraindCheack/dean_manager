import 'package:dean_manager/common/constants/common_constants.dart';
import 'package:dean_manager/common/hive/group/group_hive.dart';
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
    updateGroups();
    subscribe();
    super.onInit();
  }

  void subscribe() {
    mainController.selected.stream.listen((_) {
      selected = null;
      if (mainController.selected.value is GroupHive) {
        selected = mainController.selected.value;
      }
      updateGroups();
    });
    filter.stream
        .debounceTime(const Duration(milliseconds: debounceTime))
        .listen((_) => updateGroups());
  }

  void selectGroup(GroupHive? group) {
    mainController.selected(group ?? '');
  }

  void updateGroups() async {
    list(await mainController.getGroups(filter: filter.string));
  }

  void editBtnHandler(GroupHive group, GroupHive newGroup) {
    Get.close(0);
    group.name = newGroup.name;
    group.save();
    updateGroups();
  }

  void onGroupDelete(GroupHive group) {
    group.delete();
    updateGroups();
  }

  void formSubmitHandler(GroupHive group) {
    Get.close(0);
    Get.find<DbService>().addGroup(group);
    updateGroups();
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
