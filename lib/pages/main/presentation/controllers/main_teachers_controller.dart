import 'package:dean_manager/common/constants/common_constants.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:dean_manager/common/presentation/teachers_form/teachers_form.dart';
import 'package:dean_manager/common/services/db_service.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_filter_controller.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class MainTeachersController extends GetxController
    implements IMainFilterController<TeacherHive> {
  MainTeachersController({required this.mainController});

  TeacherHive? selected;
  final MainController mainController;
  final TextEditingController filterController = TextEditingController();

  @override
  RxList<TeacherHive> list = <TeacherHive>[].obs;
  @override
  RxString filter = ''.obs;
  @override
  RxBool hidden = false.obs;

  @override
  void onInit() {
    updateTeachers();
    subscribe();
    super.onInit();
  }

  void subscribe() {
    mainController.selected.stream.listen((_) {
      selected = null;
      if (mainController.selected.value is TeacherHive) {
        selected = mainController.selected.value;
      }
      updateTeachers();
    });
    filter.stream
        .debounceTime(const Duration(milliseconds: debounceTime))
        .listen((_) => updateTeachers());
  }

  void selectTeacher(TeacherHive teacher) {
    mainController.selected(teacher);
  }

  void updateTeachers() async {
    list(await mainController.getTeachers(filter: filter.string));
  }

  void editBtnHandler(TeacherHive teacher, TeacherHive newTeacher) {
    Get.close(0);
    teacher.firstName = newTeacher.firstName;
    teacher.lastName = newTeacher.lastName;
    teacher.middleName = newTeacher.middleName;
    teacher.groups = newTeacher.groups;
    teacher.save();
    updateTeachers();
  }

  void onGroupDelete(TeacherHive group) {
    group.delete();
    updateTeachers();
  }

  void formSubmitHandler(TeacherHive teacher) {
    Get.close(0);
    Get.find<DbService>().addTeacher(teacher);
    updateTeachers();
  }

  @override
  void clearFilters() {
    filter('');
    filterController.value = const TextEditingValue(text: '');
  }

  @override
  void addBtnHandler() {
    Get.defaultDialog(
      title: 'New student',
      content: TeacherForm(onSubmit: formSubmitHandler),
    );
  }
}
