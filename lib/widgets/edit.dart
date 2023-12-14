import 'package:flutter/material.dart';
import 'package:travel_app/db/functions/db_functions.dart';

final startingController = TextEditingController();
final destinyController = TextEditingController();
final endDateController = TextEditingController();
final budgetController = TextEditingController();

class Edit extends StatefulWidget {
  final String strt;
  final String des;
  final String endDate;
  final String budget;
  final int id;
  const Edit({
    super.key,
    required this.des,
    required this.endDate,
    required this.budget,
    required this.id,
    required this.strt,
  });

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
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
    getAllTrip();
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
                        setState(() {
                          editTrip(widget.id);
                        });

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
}
