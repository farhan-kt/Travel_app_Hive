// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/expense_provider.dart';
import 'package:travel_app/controller/trip_provider.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/model/expense_model/expense_model.dart';
import 'package:travel_app/widgets/bottombar.dart';
import 'package:travel_app/widgets/exp_category.dart';
import 'package:travel_app/widgets/totalexp.dart';

class ScreenExp extends StatelessWidget {
  ScreenExp({super.key});

  int calculateTotalFoodAmount(List<ExpenseModel> expenses) {
    return expenses
        .map((expense) => int.tryParse(expense.food) ?? 0)
        .reduce((value, element) => value + element);
  }

  int calculateTotalTravelAmount(List<ExpenseModel> expenses) {
    return expenses
        .map((expense) => int.tryParse(expense.travel) ?? 0)
        .reduce((value, element) => value + element);
  }

  int calculateTotalHotelAmount(List<ExpenseModel> expenses) {
    return expenses
        .map((expense) => int.tryParse(expense.hotel) ?? 0)
        .reduce((value, element) => value + element);
  }

  int calculateTotalOthersAmount(List<ExpenseModel> expenses) {
    return expenses
        .map((expense) => int.tryParse(expense.others) ?? 0)
        .reduce((value, element) => value + element);
  }

  late String ongoingBudget;

  @override
  Widget build(BuildContext context) {
    final tripProvider = Provider.of<TripProvider>(context, listen: false);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    const sizedBox = SizedBox(height: 15);
    if (tripProvider.ongoingTrip.isNotEmpty) {
      ongoingBudget = tripProvider.ongoingTrip.first.budget;
    } else {
      ongoingBudget = '₹ 0';
    }
    Provider.of<ExpenseProvider>(context, listen: false).getAllExp();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: GreenColor.green,
          centerTitle: true,
          title: const Text('ONGOING EXPENSES',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: YellowColor.yellow)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenBtm()),
                  (route) => false);
            },
          ),
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset('assets/expenses.json',
                width: screenWidth * 0.25, height: screenHeight * 0.15),
            Center(
              child: TotalExp(
                ongoingBudget: ongoingBudget,
              ),
            ),
            sizedBox,
            Consumer<ExpenseProvider>(builder: (context, value, child) {
              if (value.expense.isEmpty) {
                return const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expenses(
                            money: '₹ 0',
                            category: 'FOOD',
                            icons: Icons.food_bank),
                        Expenses(
                            money: '₹ 0',
                            category: 'TRAVEL',
                            icons: Icons.airport_shuttle),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expenses(
                            money: '₹ 0',
                            category: 'HOTEL',
                            icons: Icons.hotel),
                        Expenses(
                            money: '₹ 0',
                            category: 'OTHERS',
                            icons: Icons.menu_rounded),
                      ],
                    )
                  ],
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final totalFoodAmount =
                        calculateTotalFoodAmount(value.expense);
                    final totalTravelAmount =
                        calculateTotalTravelAmount(value.expense);
                    final totalHotelAmount =
                        calculateTotalHotelAmount(value.expense);
                    final totalOthersAmount =
                        calculateTotalOthersAmount(value.expense);
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expenses(
                              money: totalFoodAmount.toString(),
                              category: 'FOOD',
                              icons: Icons.food_bank,
                            ),
                            Expenses(
                              money: totalTravelAmount.toString(),
                              category: 'TRAVEL',
                              icons: Icons.airport_shuttle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expenses(
                              money: totalHotelAmount.toString(),
                              category: 'HOTEL',
                              icons: Icons.hotel,
                            ),
                            Expenses(
                              money: totalOthersAmount.toString(),
                              category: 'OTHERS',
                              icons: Icons.menu_rounded,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
