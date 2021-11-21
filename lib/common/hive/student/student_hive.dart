import 'package:dean_manager/common/constants/hive_constants.dart';
import 'package:dean_manager/common/hive/group/group_hive.dart';
import 'package:dean_manager/common/interfaces/i_user.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'student_hive.g.dart';

@HiveType(typeId: HiveConst.studentTypeId)
class StudentHive extends HiveObject implements UserInterface {
  StudentHive({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.group,
  }) : super();

  @override
  @HiveField(0)
  String firstName;

  @override
  @HiveField(1)
  String lastName;

  @override
  @HiveField(2)
  String middleName;

  @HiveField(3)
  GroupHive group;

  String get fullName => '$lastName $firstName $middleName';
  String get shortName =>
      '$lastName ${firstName[0].toUpperCase()}. ${middleName[0].toUpperCase()}.';
}
