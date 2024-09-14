// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotesDataAdapter extends TypeAdapter<NotesData> {
  @override
  final int typeId = 0;

  @override
  NotesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotesData(
      image: (fields[0] as List?)?.cast<String>(),
      cardText: fields[1] as String?,
      itemsText: fields[5] as String?,
      stressValue: fields[2] as double?,
      selfRatingValue: fields[3] as double?,
      notes: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NotesData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.cardText)
      ..writeByte(2)
      ..write(obj.stressValue)
      ..writeByte(3)
      ..write(obj.selfRatingValue)
      ..writeByte(4)
      ..write(obj.notes)
      ..writeByte(5)
      ..write(obj.itemsText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotesDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
