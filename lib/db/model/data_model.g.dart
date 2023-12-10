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
      image: fields[0] as String,
      startingPoint: fields[1] as String,
      endingingPoint: fields[2] as String,
      budget: fields[3] as String,
      startingDate: fields[4] as String,
      endingingDate: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TripModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.startingPoint)
      ..writeByte(2)
      ..write(obj.endingingPoint)
      ..writeByte(3)
      ..write(obj.budget)
      ..writeByte(4)
      ..write(obj.startingDate)
      ..writeByte(5)
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
