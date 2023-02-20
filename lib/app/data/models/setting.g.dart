// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingAdapter extends TypeAdapter<Setting> {
  @override
  final int typeId = 3;

  @override
  Setting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Setting(
      isSundayFirstDayOfWeek: fields[0] as bool,
      language: fields[1] as int,
      isOnNotification: fields[2] as bool,
      isOnPINLock: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Setting obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.isSundayFirstDayOfWeek)
      ..writeByte(1)
      ..write(obj.language)
      ..writeByte(2)
      ..write(obj.isOnNotification)
      ..writeByte(3)
      ..write(obj.isOnPINLock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
