import 'package:dean_manager/common/constants/hive_constants.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'group_hive.g.dart';

@HiveType(typeId: HiveConst.groupTypeId)
class GroupHive extends HiveObject {
  GroupHive({
    required this.name,
    this.students = const <StudentHive>[],
    this.teachers = const <TeacherHive>[],
  }) : super();

  @HiveField(0)
  List<StudentHive> students;

  @HiveField(1)
  List<TeacherHive> teachers;

  @HiveField(2)
  String name;
}
