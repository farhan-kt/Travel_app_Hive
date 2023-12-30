import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/db/functions/exp_functions.dart';
import 'package:travel_app/db/model/expense_model.dart';
import 'package:travel_app/helper/colors.dart';

class ExpEdit extends StatefulWidget {
  const ExpEdit({super.key});

  @override
  State<ExpEdit> createState() => _ExpEditState();
}

class _ExpEditState extends State<ExpEdit> {
  final _foodEditController = TextEditingController();
  final _travelEditController = TextEditingController();
  final _hotelEditController = TextEditingController();
  final _othersEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: GreenColor.green,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('ADD EXPENCES',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: YellowColor.yellow)),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(YellowColor.yellow),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'ADD',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 25, left: 15, right: 15, bottom: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _foodEditController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 7,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'FOOD',
                            labelStyle: TextStyle(color: YellowColor.yellow),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: _travelEditController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 7,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'TRAVEL',
                            labelStyle: TextStyle(color: YellowColor.yellow),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
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
                          controller: _hotelEditController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 7,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'HOTEL',
                            labelStyle: TextStyle(color: YellowColor.yellow),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: _othersEditController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          maxLength: 7,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: 'OTHERS',
                            labelStyle: TextStyle(color: YellowColor.yellow),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
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
    ));
  }

  Future<void> expUpdate() async {
    final _food = _foodEditController.text.trim();
    final _travel = _travelEditController.text.trim();
    final _hotel = _hotelEditController.text.trim();
    final _others = _othersEditController.text.trim();

    if (_food.isEmpty && _travel.isEmpty && _hotel.isEmpty && _others.isEmpty) {
      return;
    } else {
      final expupdated = ExpenseModel(
          food: _food, travel: _travel, hotel: _hotel, others: _others);

      await editExp(expupdated);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Updated Successfully'),
        behavior: SnackBarBehavior.floating,
      ));

      getAllExp();
      setState(() {});
      Navigator.pop(context);
    }
  }
}
