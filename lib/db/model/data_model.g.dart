// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripModelAdapter extends TypeAdapter<TripModel> {
  @override
  final int typeId = 1;

  @override
  TripModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TripModel(
      image: fields[1] as String,
      startingPoint: fields[2] as String,
      endingingPoint: fields[3] as String,
      budget: fields[4] as String,
      startingDate: fields[5] as String,
      endingingDate: fields[6] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TripModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.startingPoint)
      ..writeByte(3)
      ..write(obj.endingingPoint)
      ..writeByte(4)
      ..write(obj.budget)
      ..writeByte(5)
      ..write(obj.startingDate)
      ..writeByte(6)
      ..write(obj.endingingDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
