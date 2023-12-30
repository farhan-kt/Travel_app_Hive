import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/db/model/expense_model.dart';

ValueNotifier<List<ExpenseModel>> ExpenseListNotifier = ValueNotifier([]);

Future<void> addExp(ExpenseModel value) async {
  final expDB = await Hive.openBox<ExpenseModel>('exp_db');
  await expDB.add(value);
  ExpenseListNotifier.value.add(value);
  ExpenseListNotifier.notifyListeners();
}

void getAllExp() async {
  final expDB = await Hive.openBox<ExpenseModel>('exp_db');
  ExpenseListNotifier.value.clear();
  ExpenseListNotifier.value.addAll(expDB.values);
  ExpenseListNotifier.notifyListeners();
}

Future<void> deleteAllExp() async {
  final expDB = await Hive.openBox<ExpenseModel>('exp_db');
  await expDB.clear();
  print('All entries deleted');
  getAllExp();
}

Future<void> editExp(ExpenseModel value) async {
  final expDB = await Hive.openBox<ExpenseModel>('exp_db');
  await expDB.clear();
  await expDB.add(value);
}
