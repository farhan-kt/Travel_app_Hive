import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/model/expense_model/expense_model.dart';

class ExpService {
  Future getAllExpense() async {
    final expenseDb = await Hive.openBox<ExpenseModel>('exp_db');
    return expenseDb.values.toList();
  }

  Future addExpense(ExpenseModel value) async {
    final expenseDb = await Hive.openBox<ExpenseModel>('exp_db');
    return expenseDb.add(value);
  }

  Future deleteAllExp() async {
    final expenseDb = await Hive.openBox<ExpenseModel>('exp_db');
    return expenseDb.clear();
  }
}
