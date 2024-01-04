// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/model/expense_model/expense_model.dart';

ValueNotifier<List<ExpenseModel>> expenseListNotifier = ValueNotifier([]);

Future<void> addExp(ExpenseModel value) async {
  final expDB = await Hive.openBox<ExpenseModel>('exp_db');
  await expDB.add(value);
  expenseListNotifier.value.add(value);
  expenseListNotifier.notifyListeners();
}

void getAllExp() async {
  final expDB = await Hive.openBox<ExpenseModel>('exp_db');
  expenseListNotifier.value.clear();
  expenseListNotifier.value.addAll(expDB.values);
  expenseListNotifier.notifyListeners();
}

Future<void> deleteAllExp() async {
  final expDB = await Hive.openBox<ExpenseModel>('exp_db');
  await expDB.clear();
  getAllExp();
}
