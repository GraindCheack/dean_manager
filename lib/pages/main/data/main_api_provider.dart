import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/services/db_service.dart';
import 'package:dean_manager/pages/main/domain/interfaces/i_main_provider.dart';
import 'package:get/get.dart';

class MainProvider extends GetConnect implements IMainProvider {
  @override
  void onInit() {}

  @override
  List<GroupHive> getGroups() {
    return Get.find<DbService>().groups;
  }

  @override
  List<StudentHive> getStudents() {
    return Get.find<DbService>().students;
  }

  @override
  List<TeacherHive> getTeachers() {
    return Get.find<DbService>().teachers;
  }
}
