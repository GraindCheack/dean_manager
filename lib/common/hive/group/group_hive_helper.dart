import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';

abstract class GroupHiveHelper {
  static void edit(
    GroupHive obj, {
    String? name,
    List<StudentHive>? students,
    List<TeacherHive>? teachers,
  }) {
    obj
      ..students = students ?? obj.students
      ..teachers = teachers ?? obj.teachers
      ..name = name ?? obj.name;
    obj.save();
  }

  static void remove(GroupHive obj) {
    obj.delete();
  }
}
