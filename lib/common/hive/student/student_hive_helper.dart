import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';

abstract class StudentHiveHelper {
  static void edit(
    StudentHive obj, {
    GroupHive? group,
  }) {
    obj.group = group ?? obj.group;
    obj.save();
  }

  static void remove(StudentHive obj) {
    obj.delete();
  }
}
