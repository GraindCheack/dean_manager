import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_provider.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_repository.dart';

class MainRepository implements IMainRepository {
  MainRepository({required this.provider});
  final IMainProvider provider;

  @override
  Future<List<GroupHive>> getGroups() async {
    return provider.getGroups();
  }

  @override
  Future<List<StudentHive>> getStudents() async {
    return provider.getStudents();
  }

  @override
  Future<List<TeacherHive>> getTeachers() async {
    return provider.getTeachers();
  }
}
