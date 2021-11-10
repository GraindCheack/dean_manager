import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';

abstract class IMainProvider {
  List<StudentHive> getStudents();
  List<TeacherHive> getTeachers();
  List<GroupHive> getGroups();
}
