import 'package:flutter/material.dart';
import 'package:travel_app/model/expense_model/expense_model.dart';
import 'package:travel_app/service/expense_service.dart';

class ExpenseProvider extends ChangeNotifier {
  List<ExpenseModel> expense = [];
  ExpService expservice = ExpService();

  Future getAllExp() async {
    expense = await expservice.getAllExpense();
    notifyListeners();
  }

  Future addExpense(ExpenseModel value) async {
    await expservice.addExpense(value);
    getAllExp();
  }

  Future deleteAllExp() async {
    await expservice.deleteAllExp();
    await getAllExp();
  }
}
