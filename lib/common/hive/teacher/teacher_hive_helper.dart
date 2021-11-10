import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';

abstract class TeacherHiveHelper {
  static void edit(
    TeacherHive obj, {
    List<GroupHive>? groups,
  }) {
    obj.groups = groups ?? obj.groups;
    obj.save();
  }

  static void remove(TeacherHive obj) {
    obj.delete();
  }
}
