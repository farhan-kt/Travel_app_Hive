// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/expense_provider.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/model/expense_model/expense_model.dart';
import 'package:travel_app/widgets/exp_textformfield.dart';

class TotalExp extends StatelessWidget {
  final String ongoingBudget;
  TotalExp({super.key, required this.ongoingBudget});

  final _foodController = TextEditingController();
  final _travelController = TextEditingController();
  final _hotelController = TextEditingController();
  final _othersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Container(
      height: mediaQuery.height * 0.25,
      width: mediaQuery.width * 0.7,
      decoration: BoxDecoration(
        border: Border.all(
          color: YellowColor.yellow,
          width: 4,
        ),
        color: const Color.fromARGB(255, 75, 120, 111),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "TRIP BUDGET :",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                ongoingBudget,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "TOTAL EXPENSES :",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(
                width: 10,
              ),
              Consumer<ExpenseProvider>(
                builder: (context, value, child) {
                  return Text(
                    calculateTotal(value.expense),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ADD EXPENCES',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: GreenColor.green,
                              height: mediaQuery.height * 0.4,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text('ADD EXPENCES',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: YellowColor.yellow)),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      YellowColor.yellow),
                                            ),
                                            onPressed: () {
                                              onAddExpClicked(context);
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'ADD',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            ))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 15,
                                          right: 15,
                                          bottom: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ExpField(
                                                    labelText: 'FOOD',
                                                    suffixIcon: Icons.food_bank,
                                                    controller:
                                                        _foodController),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: ExpField(
                                                    labelText: 'TRAVEL',
                                                    suffixIcon:
                                                        Icons.airport_shuttle,
                                                    controller:
                                                        _travelController),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ExpField(
                                                    labelText: 'HOTEL',
                                                    suffixIcon: Icons.hotel,
                                                    controller:
                                                        _hotelController),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: ExpField(
                                                    labelText: 'OTHERS',
                                                    suffixIcon:
                                                        Icons.menu_rounded,
                                                    controller:
                                                        _othersController),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
                      color: YellowColor.yellow,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddExpClicked(context) async {
    final addProv = Provider.of<ExpenseProvider>(context, listen: false);
    final food = _foodController.text.trim();
    final travel = _travelController.text.trim();
    final hotel = _hotelController.text.trim();
    final others = _othersController.text.trim();

    if (food.isEmpty && travel.isEmpty && hotel.isEmpty && others.isEmpty) {
      return;
    }

    int foodAmount = int.tryParse(food) ?? 0;
    int travelAmount = int.tryParse(travel) ?? 0;
    int hotelAmount = int.tryParse(hotel) ?? 0;
    int othersAmount = int.tryParse(others) ?? 0;

    if (addProv.expense.isNotEmpty) {
      for (final expense in addProv.expense) {
        if (expense.food.isNotEmpty) {
          foodAmount += int.tryParse(expense.food) ?? 0;
        }
        if (expense.travel.isNotEmpty) {
          travelAmount += int.tryParse(expense.travel) ?? 0;
        }
        if (expense.hotel.isNotEmpty) {
          hotelAmount += int.tryParse(expense.hotel) ?? 0;
        }
        if (expense.others.isNotEmpty) {
          othersAmount += int.tryParse(expense.others) ?? 0;
        }
      }
    }

    _foodController.text = foodAmount.toString();
    _travelController.text = travelAmount.toString();
    _hotelController.text = hotelAmount.toString();
    _othersController.text = othersAmount.toString();

    final amount = ExpenseModel(
      food: food,
      travel: travel,
      hotel: hotel,
      others: others,
      total: calculateTotal(addProv.expense),
    );
    await addProv.addExpense(amount);
    _foodController.clear();
    _travelController.clear();
    _hotelController.clear();
    _othersController.clear();
  }

  String calculateTotal(List<ExpenseModel> expenses) {
    int foodTotal = 0;
    int travelTotal = 0;
    int hotelTotal = 0;
    int othersTotal = 0;

    for (final expense in expenses) {
      foodTotal += int.tryParse(expense.food) ?? 0;
      travelTotal += int.tryParse(expense.travel) ?? 0;
      hotelTotal += int.tryParse(expense.hotel) ?? 0;
      othersTotal += int.tryParse(expense.others) ?? 0;
    }

    int total = foodTotal + travelTotal + hotelTotal + othersTotal;
    return total.toString();
  }
}
