import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class DbService extends GetxService {
  late final Box<StudentHive> _studentsBox;
  late final Box<TeacherHive> _teachersBox;
  late final Box<GroupHive> _groupsBox;

  late final List<StudentHive> students;
  late final List<TeacherHive> teachers;
  late final List<GroupHive> groups;

  Future<DbService> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(StudentHiveAdapter());
    Hive.registerAdapter(TeacherHiveAdapter());
    Hive.registerAdapter(GroupHiveAdapter());

    _studentsBox = await Hive.openBox<StudentHive>('students');
    _teachersBox = await Hive.openBox<TeacherHive>('teachers');
    _groupsBox = await Hive.openBox<GroupHive>('groups');

    students = HiveList(_studentsBox);
    teachers = HiveList(_teachersBox);
    groups = HiveList(_groupsBox);

    return this;
  }
}
