// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherHiveAdapter extends TypeAdapter<TeacherHive> {
  @override
  final int typeId = 2;

  @override
  TeacherHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeacherHive(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      middleName: fields[2] as String,
      groups: (fields[3] as List).cast<GroupHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, TeacherHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.middleName)
      ..writeByte(3)
      ..write(obj.groups);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
