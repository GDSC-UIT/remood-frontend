// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_point.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class reportPointAdapter extends TypeAdapter<reportPoint> {
  @override
  final int typeId = 2;

  @override
  reportPoint read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return reportPoint(
      date: fields[1] as DateTime?,
      percentage: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, reportPoint obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.percentage)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is reportPointAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
