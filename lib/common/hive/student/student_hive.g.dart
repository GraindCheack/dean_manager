// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentHiveAdapter extends TypeAdapter<StudentHive> {
  @override
  final int typeId = 1;

  @override
  StudentHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentHive(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      middleName: fields[2] as String,
      group: fields[3] as GroupHive,
    );
  }

  @override
  void write(BinaryWriter writer, StudentHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.middleName)
      ..writeByte(3)
      ..write(obj.group);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
