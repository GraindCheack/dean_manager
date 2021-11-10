import 'package:dean_manager/common/constants/hive_constants.dart';
import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/interfaces/i_user.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'teacher_hive.g.dart';

@HiveType(typeId: HiveConst.teacherTypeId)
class TeacherHive extends HiveObject implements UserInterface {
  TeacherHive({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    this.groups = const <GroupHive>[],
  }) : super();

  @override
  @HiveField(0)
  final String firstName;

  @override
  @HiveField(1)
  final String lastName;

  @override
  @HiveField(2)
  final String middleName;

  @HiveField(3)
  List<GroupHive> groups;

  String get fullName => '$lastName $firstName $middleName';
  String get shortName =>
      '$lastName ${firstName[0].toUpperCase()}. ${middleName[0].toUpperCase()}.';
}
