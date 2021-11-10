// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupHiveAdapter extends TypeAdapter<GroupHive> {
  @override
  final int typeId = 0;

  @override
  GroupHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupHive(
      name: fields[2] as String,
      students: (fields[0] as List).cast<StudentHive>(),
      teachers: (fields[1] as List).cast<TeacherHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.students)
      ..writeByte(1)
      ..write(obj.teachers)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
