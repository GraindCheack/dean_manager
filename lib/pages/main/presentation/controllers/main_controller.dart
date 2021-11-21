import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_repository.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController({required this.mainRepository}) : super();
  final IMainRepository mainRepository;

  final Rx<dynamic> selected = Rx<dynamic>(null);

  Future<List<GroupHive>> getGroups({String? filter}) async {
    var groups = await mainRepository.getGroups();

    if (selected.value is TeacherHive) {
      final selectedTeacher = selected.value as TeacherHive;
      groups = groups
          .where(
            (e) => selectedTeacher.groups.any((group) => group.name == e.name),
          )
          .toList();
    }

    if (selected.value is StudentHive) {
      final selectedStudent = selected.value as StudentHive;
      groups =
          groups.where((e) => selectedStudent.group.name == e.name).toList();
    }

    if (filter != null) {
      groups = groups.where((e) => e.name.contains(filter)).toList();
    }

    return groups;
  }

  Future<List<StudentHive>> getStudents({String? filter}) async {
    var students = await mainRepository.getStudents();

    if (selected.value is GroupHive) {
      final selectedGroup = selected.value as GroupHive;
      students =
          students.where((e) => e.group.name == selectedGroup.name).toList();
    }

    if (selected.value is TeacherHive) {
      final selectedTeacher = selected.value as TeacherHive;
      students = students
          .where((e) =>
              selectedTeacher.groups.any((group) => group.name == e.group.name))
          .toList();
    }

    if (filter != null) {
      students = students.where((e) => e.fullName.contains(filter)).toList();
    }

    return students;
  }

  Future<List<TeacherHive>> getTeachers({String? filter}) async {
    var teachers = await mainRepository.getTeachers();

    if (selected.value is GroupHive) {
      teachers =
          teachers.where((e) => e.groups.contains(selected.value)).toList();
    }

    if (selected.value is StudentHive) {
      teachers = teachers
          .where((e) => e.groups.contains(selected.value.group))
          .toList();
    }

    if (filter != null) {
      teachers = teachers.where((e) => e.fullName.contains(filter)).toList();
    }

    return teachers;
  }
}
