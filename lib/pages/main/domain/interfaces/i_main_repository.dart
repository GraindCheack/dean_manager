import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';

abstract class IMainRepository {
  Future<List<StudentHive>> getStudents();
  Future<List<TeacherHive>> getTeachers();
  Future<List<GroupHive>> getGroups();
}
