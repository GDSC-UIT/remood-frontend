// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiaryAdapter extends TypeAdapter<Diary> {
  @override
  final int typeId = 0;

  @override
  Diary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Diary(
      diary: fields[0] as String,
      date: fields[1] as DateTime,
      diaryColor: fields[3] as int,
      icon: fields[2] as int,
      title: fields[4] as String,
      image: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Diary obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.diary)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.diaryColor)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
