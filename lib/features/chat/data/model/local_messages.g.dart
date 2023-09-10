// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_messages.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalMessageAdapter extends TypeAdapter<LocalMessage> {
  @override
  final int typeId = 0;

  @override
  LocalMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalMessage(
      contant: fields[0] as String,
      time: fields[1] as String,
      uId: fields[2] as String,
      fullName: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalMessage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.contant)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.uId)
      ..writeByte(3)
      ..write(obj.fullName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
