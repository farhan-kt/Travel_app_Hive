import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/db/functions/exp_functions.dart';
import 'package:travel_app/db/model/expense_model.dart';
import 'package:travel_app/helper/colors.dart';

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
  late String foodamt;
  late String travelamt;
  late String hotelamt;
  late String othersamt;

  @override
  void initState() {
    super.initState();
    if (ExpenseListNotifier.value.isNotEmpty) {
      for (final expense in ExpenseListNotifier.value) {
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
    String calculateTotal() {
      int foodTotal = int.tryParse(_foodController.text) ?? 0;
      int travelTotal = int.tryParse(_travelController.text) ?? 0;
      int hotelTotal = int.tryParse(_hotelController.text) ?? 0;
      int othersTotal = int.tryParse(_othersController.text) ?? 0;

      int total = foodTotal + travelTotal + hotelTotal + othersTotal;
      return total.toString();
    }

    return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          border: Border.all(color: YellowColor.yellow, width: 4),
          color: Colors.white,
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
                      color: Colors.red,
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
                  valueListenable: ExpenseListNotifier,
                  builder: (context, expenses, child) {
                    return Text(
                      calculateTotal(),
                      style: const TextStyle(
                        color: Colors.red,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ))
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25,
                                            left: 15,
                                            right: 15,
                                            bottom: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller: _foodController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                    ],
                                                    maxLength: 7,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'FOOD',
                                                      labelStyle: TextStyle(
                                                          color: YellowColor
                                                              .yellow),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: TextFormField(
                                                    controller:
                                                        _travelController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                    ],
                                                    maxLength: 7,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'TRAVEL',
                                                      labelStyle: TextStyle(
                                                          color: YellowColor
                                                              .yellow),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller:
                                                        _hotelController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                    ],
                                                    maxLength: 7,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'HOTEL',
                                                      labelStyle: TextStyle(
                                                          color: YellowColor
                                                              .yellow),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: TextFormField(
                                                    controller:
                                                        _othersController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                    ],
                                                    maxLength: 7,
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: 'OTHERS',
                                                      labelStyle: TextStyle(
                                                          color: YellowColor
                                                              .yellow),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
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
                        color: Colors.red,
                      )),
                ],
              ),
            ],
          ),
        ));
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
