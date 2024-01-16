// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/trip_provider.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/model/trip_model/trip_model.dart';

class Edit extends StatefulWidget {
  final String strt;
  final String des;
  final String endDate;
  final String budget;
  final int id;
  final TripModel trip;
  const Edit({
    super.key,
    required this.strt,
    required this.des,
    required this.endDate,
    required this.budget,
    required this.id,
    required this.trip,
  });

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final startingController = TextEditingController();
  final destinyController = TextEditingController();
  final endDateController = TextEditingController();
  final budgetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startingController.text = widget.strt;
    destinyController.text = widget.des;
    endDateController.text = widget.endDate;
    budgetController.text = widget.budget;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Container(
        height: mediaQuery.height * 0.4,
        width: mediaQuery.width * 1,
        color: GreenColor.green,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: startingController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Change StartingPoint',
                    labelStyle: TextStyle(color: YellowColor.yellow),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: destinyController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Change Destination',
                    labelStyle: TextStyle(color: YellowColor.yellow),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: endDateController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Change Ending Date',
                    labelStyle: TextStyle(color: YellowColor.yellow),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2075));
                    if (pickedDate != null) {
                      endDateController.text =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: budgetController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Add Budget',
                    labelStyle: TextStyle(color: YellowColor.yellow),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            YellowColor.yellow),
                      ),
                      onPressed: () {
                        updated(context);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'DONE',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.black),
                      )),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> updated(BuildContext context) async {
    final editProvider = Provider.of<TripProvider>(context, listen: false);

    final starting = startingController.text.trim();
    final destiny = destinyController.text.trim();
    final enddate = endDateController.text.trim();
    final budget = budgetController.text.trim();

    if (starting.isEmpty ||
        destiny.isEmpty ||
        enddate.isEmpty ||
        budget.isEmpty) {
      return;
    } else {
      final existingImage = widget.trip.image;
      final existingStartingDate = widget.trip.startingDate;

      final updated = TripModel(
        id: widget.id,
        image: existingImage,
        startingPoint: starting,
        endingingPoint: destiny,
        budget: budget,
        startingDate: existingStartingDate,
        endingDate: enddate,
      );

      await editProvider.editTrip(widget.id, updated);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Updated Successfully'),
        behavior: SnackBarBehavior.floating,
      ));
      await editProvider.getAllTrip();
      Navigator.pop(context);
    }
  }
}
