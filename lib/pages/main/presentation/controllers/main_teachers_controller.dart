import 'package:dean_manager/common/constants/common_constants.dart';
import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
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
    mainController.updateTeachers();
    subscribe();
    super.onInit();
  }

  void subscribe() {
    mainController.teachers.listen(
      (teachers) => list(
        filterTeachers(teachers, mainController.selected.value),
      ),
    );
    mainController.selected.stream.listen((value) {
      selected = null;
      if (value is TeacherHive) {
        selected = value;
      }
    });
    filter.stream
        .debounceTime(const Duration(milliseconds: debounceTime))
        .listen((_) => mainController.updateTeachers());
  }

  void selectTeacher(TeacherHive? teacher) {
    if (teacher != null && teacher != selected) {
      mainController.selected(teacher);
      return;
    }
    mainController.selected('');
  }

  void editBtnHandler(TeacherHive teacher, TeacherHive newTeacher) {
    Get.close(0);
    teacher.firstName = newTeacher.firstName;
    teacher.lastName = newTeacher.lastName;
    teacher.middleName = newTeacher.middleName;
    teacher.groups = newTeacher.groups;
    teacher.save();
    mainController.updateTeachers();
  }

  void onGroupDelete(TeacherHive group) {
    group.delete();
    mainController.updateAll();
  }

  void formSubmitHandler(TeacherHive teacher) {
    Get.close(0);
    Get.find<DbService>().addTeacher(teacher);
    mainController.updateTeachers();
  }

  List<TeacherHive> filterTeachers(
      List<TeacherHive> teachers, dynamic selected) {
    if (selected is GroupHive) {
      teachers = teachers.where((e) => e.groups.contains(selected)).toList();
    }

    if (selected is StudentHive) {
      teachers =
          teachers.where((e) => e.groups.contains(selected.group)).toList();
    }

    teachers = teachers.where((e) => e.fullName.contains(filter)).toList();

    return teachers;
  }

  @override
  void clearFilters() {
    if (selected != null) {
      selectTeacher(null);
    }
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
