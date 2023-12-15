import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/db/functions/db_functions.dart';
import 'package:travel_app/db/model/data_model.dart';
import 'package:travel_app/screens/ongoing.dart';

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
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 1,
        color: const Color(0xFF355952),
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
                    labelStyle: TextStyle(color: Color(0xFFF3CD53)),
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
                    labelStyle: TextStyle(color: Color(0xFFF3CD53)),
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
                    labelStyle: TextStyle(color: Color(0xFFF3CD53)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onTap: () async {
                    DateTime? Pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2075));
                    if (Pickeddate != null) {
                      setState(() {
                        print('Selected Date: ${Pickeddate}');
                        endDateController.text =
                            DateFormat('dd-MM-yyyy').format(Pickeddate);
                      });
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
                    labelStyle: TextStyle(color: Color(0xFFF3CD53)),
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
                            const Color(0xFFF3CD53)),
                      ),
                      onPressed: () {
                        updated();
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

  // Future<void> updated() async {
  //   final starting = startingController.text.trim();
  //   final destiny = destinyController.text.trim();
  //   final enddate = endDateController.text.trim();
  //   final budget = budgetController.text.trim();
  //   if (starting.isEmpty ||
  //       destiny.isEmpty ||
  //       enddate.isEmpty ||
  //       budget.isEmpty) {
  //     return;
  //   } else {
  //     final existingImage = widget.trip.image;
  //     final existingStartingDate = widget.trip.startingDate;

  //     final updated = TripModel(
  //         image: existingImage,
  //         startingPoint: starting,
  //         endingingPoint: destiny,
  //         budget: budget,
  //         startingDate: existingStartingDate,
  //         endingingDate: enddate);

  //     editTrip(widget.id, updated);

  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text('Updated Successfully'),
  //       behavior: SnackBarBehavior.floating,
  //     ));
  //     getAllTrip();
  //   }
  // }

  Future<void> updated() async {
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
        image: existingImage,
        startingPoint: starting,
        endingingPoint: destiny,
        budget: budget,
        startingDate: existingStartingDate,
        endingingDate: enddate,
      );

      await editTrip(widget.id, updated);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Updated Successfully'),
        behavior: SnackBarBehavior.floating,
      ));

      await getAllTrip();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OngoingDetails(
            id: widget.id,
            trip: updated,
          ),
        ),
      );
    }
  }
}
