import 'package:dean_manager/common/constants/common_constants.dart';
import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:dean_manager/common/presentation/group_form/group_form.dart';
import 'package:dean_manager/common/presentation/student_form/student_form.dart';
import 'package:dean_manager/common/services/db_service.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_filter_controller.dart';
import 'package:dean_manager/pages/main/presentation/controllers/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class MainStudentsController extends GetxController
    implements IMainFilterController<StudentHive> {
  MainStudentsController({required this.mainController});

  final MainController mainController;
  final TextEditingController filterController = TextEditingController();

  @override
  StudentHive? selected;
  @override
  RxList<StudentHive> list = <StudentHive>[].obs;
  @override
  RxString filter = ''.obs;
  @override
  RxBool hidden = false.obs;

  @override
  void onInit() {
    mainController.updateStudents();
    subscribe();
    super.onInit();
  }

  void subscribe() {
    mainController.students.listen(
      (students) => list(
        filterStudents(students, mainController.selected.value),
      ),
    );
    mainController.selected.stream.listen((value) {
      selected = null;
      if (value is StudentHive) {
        selected = value;
      }
    });
    filter.stream
        .debounceTime(const Duration(milliseconds: debounceTime))
        .listen((_) => mainController.updateStudents());
  }

  void selectStudent(StudentHive? student) {
    if (student != null && student != selected) {
      mainController.selected(student);
      return;
    }
    mainController.selected('');
  }

  void editBtnHandler(StudentHive student, StudentHive newStudent) {
    Get.close(0);
    student.firstName = newStudent.firstName;
    student.lastName = newStudent.lastName;
    student.middleName = newStudent.middleName;
    student.group = newStudent.group;
    student.save();
    mainController.updateStudents();
  }

  void onGroupDelete(StudentHive group) {
    group.delete();
    mainController.updateAll();
  }

  void formSubmitHandler(StudentHive student) {
    Get.close(0);
    Get.find<DbService>().addStudent(student);
    mainController.updateStudents();
  }

  List<StudentHive> filterStudents(
      List<StudentHive> students, dynamic selected) {
    if (selected is GroupHive) {
      final selectedGroup = selected;
      students = students
          .where(
            (e) => e.group.name == selectedGroup.name,
          )
          .toList();
    }

    if (selected is TeacherHive) {
      final selectedTeacher = selected;
      students = students
          .where(
            (e) => selectedTeacher.groups
                .any((group) => group.name == e.group.name),
          )
          .toList();
    }

    students = students.where((e) => e.fullName.contains(filter)).toList();

    return students;
  }

  @override
  void clearFilters() {
    if (selected != null) {
      selectStudent(null);
    }
    filter('');
    filterController.value = const TextEditingValue(text: '');
  }

  @override
  void addBtnHandler() {
    Get.defaultDialog(
      title: 'New student',
      content: StudentForm(onSubmit: formSubmitHandler),
    );
  }
}
