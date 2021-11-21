import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/hive/student/student_hive.dart';
import 'package:dean_manager/common/hive/teacher/teacher_hive.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class DbService extends GetxService {
  late final Box<StudentHive> _studentsBox;
  late final Box<TeacherHive> _teachersBox;
  late final Box<GroupHive> _groupsBox;

  List<StudentHive> get students => _studentsBox.values.toList();
  List<TeacherHive> get teachers => _teachersBox.values.toList();
  List<GroupHive> get groups => _groupsBox.values.toList();

  Future<DbService> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(StudentHiveAdapter());
    Hive.registerAdapter(TeacherHiveAdapter());
    Hive.registerAdapter(GroupHiveAdapter());

    _studentsBox = await Hive.openBox<StudentHive>('students');
    _teachersBox = await Hive.openBox<TeacherHive>('teachers');
    _groupsBox = await Hive.openBox<GroupHive>('groups');

    return this;
  }

  void addGroup(GroupHive group) {
    _groupsBox.add(group);
  }

  void addStudent(StudentHive student) {
    _studentsBox.add(student);
  }

  void addTeacher(TeacherHive teacher) {
    _teachersBox.add(teacher);
  }
}
