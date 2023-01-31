// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardTopicAdapter extends TypeAdapter<CardTopic> {
  @override
  final int typeId = 1;

  @override
  CardTopic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardTopic(
      title: fields[0] as String,
      TopicColor: fields[2] as int,
      icons: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CardTopic obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.icons)
      ..writeByte(2)
      ..write(obj.TopicColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardTopicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
