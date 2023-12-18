import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class TripModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String image;

  @HiveField(2)
  final String startingPoint;

  @HiveField(3)
  final String endingingPoint;

  @HiveField(4)
  final String budget;

  @HiveField(5)
  final String startingDate;

  @HiveField(6)
  final String endingDate;

  TripModel(
      {required this.image,
      required this.startingPoint,
      required this.endingingPoint,
      required this.budget,
      required this.startingDate,
      required this.endingDate,
      this.id});
}
