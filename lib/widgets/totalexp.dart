import 'package:flutter/material.dart';
import 'package:travel_app/functions/exp_functions.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/model/expense_model/expense_model.dart';
import 'package:travel_app/widgets/exptextformfield.dart';

class TotalExp extends StatefulWidget {
  final String ongoingBudget;
  const TotalExp({super.key, required this.ongoingBudget});

  @override
  State<TotalExp> createState() => _TotalExpState();
}

class _TotalExpState extends State<TotalExp> {
  final _foodController = TextEditingController();
  final _travelController = TextEditingController();
  final _hotelController = TextEditingController();
  final _othersController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (expenseListNotifier.value.isNotEmpty) {
      for (final expense in expenseListNotifier.value) {
        if (expense.food.isNotEmpty) {
          _foodController.text = expense.food;
        }
        if (expense.travel.isNotEmpty) {
          _travelController.text = expense.travel;
        }
        if (expense.hotel.isNotEmpty) {
          _hotelController.text = expense.hotel;
        }
        if (expense.others.isNotEmpty) {
          _othersController.text = expense.others;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    String calculateTotal() {
      int foodTotal = int.tryParse(_foodController.text) ?? 0;
      int travelTotal = int.tryParse(_travelController.text) ?? 0;
      int hotelTotal = int.tryParse(_hotelController.text) ?? 0;
      int othersTotal = int.tryParse(_othersController.text) ?? 0;

      int total = foodTotal + travelTotal + hotelTotal + othersTotal;
      return total.toString();
    }

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
                widget.ongoingBudget,
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
              ValueListenableBuilder<List<ExpenseModel>>(
                valueListenable: expenseListNotifier,
                builder: (context, expenses, child) {
                  return Text(
                    calculateTotal(),
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
                                              onAddExpClicked();
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

  Future<void> onAddExpClicked() async {
    final food = _foodController.text.trim();
    final travel = _travelController.text.trim();
    final hotel = _hotelController.text.trim();
    final others = _othersController.text.trim();

    if (food.isEmpty && travel.isEmpty && hotel.isEmpty && others.isEmpty) {
      return;
    }

    final amount = ExpenseModel(
      food: food,
      travel: travel,
      hotel: hotel,
      others: others,
    );

    await addExp(amount);
    getAllExp();
  }
}
