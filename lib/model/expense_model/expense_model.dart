import 'package:hive_flutter/adapters.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 2)
class ExpenseModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String food;

  @HiveField(2)
  final String travel;

  @HiveField(3)
  final String hotel;

  @HiveField(4)
  final String others;

  @HiveField(5)
  final String? total;

  ExpenseModel({
    required this.food,
    required this.travel,
    required this.hotel,
    required this.others,
    this.id,
    this.total,
  });
}
