import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class TripModel {
  @HiveField(0)
  final String image;

  @HiveField(1)
  final String startingPoint;

  @HiveField(2)
  final String endingingPoint;

  @HiveField(3)
  final String budget;

  @HiveField(4)
  final String startingDate;

  @HiveField(5)
  final String endingingDate;

  TripModel(
      {required this.image,
      required this.startingPoint,
      required this.endingingPoint,
      required this.budget,
      required this.startingDate,
      required this.endingingDate});
}
