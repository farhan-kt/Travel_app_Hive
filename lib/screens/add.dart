import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/db/functions/db_functions.dart';
import 'package:travel_app/db/model/data_model.dart';

import 'package:travel_app/widgets/textformfield.dart';

class ScreenAdd extends StatefulWidget {
  const ScreenAdd({Key? key}) : super(key: key);

  @override
  State<ScreenAdd> createState() => _ScreenAddState();
}

final Formkey2 = GlobalKey<FormState>();

class _ScreenAddState extends State<ScreenAdd> {
  final _startingPoint = TextEditingController();
  final _destinationPoint = TextEditingController();
  final _budget = TextEditingController();
  final _startingDate = TextEditingController();
  final _endingDate = TextEditingController();

  dynamic customValidator(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Value is empty';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    var sizedbox = const SizedBox(height: 10);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF355952),
        centerTitle: true,
        title: const Text(
          'ADD TRIP DETAILS',
          style:
              TextStyle(color: Color(0xFFF3CD53), fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: Formkey2,
            child: Column(
              children: [
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: screenheight * 0.3,
                    width: screenwidth * double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border:
                          Border.all(color: const Color(0xFF355952), width: 4),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ADD COVER PHOTO',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color(0xFF355952),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.add_a_photo,
                          color: Color(0xFF355952),
                        )
                      ],
                    ),
                  ),
                ),
                sizedbox,
                CustomTextFormField(
                    labelText: 'Enter starting Point',
                    suffixIcon: Icons.location_on,
                    controller: _startingPoint,
                    validator: (value) => customValidator(value)),
                sizedbox,
                CustomTextFormField(
                    labelText: 'Enter Destination',
                    suffixIcon: Icons.location_on,
                    controller: _destinationPoint,
                    validator: (value) => customValidator(value)),
                sizedbox,
                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  labelText: 'Enter Budget',
                  suffixIcon: Icons.currency_rupee_sharp,
                  controller: _budget,
                  validator: (value) => customValidator(value),
                  maxLength: 8,
                ),
                sizedbox,
                CustomTextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                  ],
                  labelText: 'Enter starting Date',
                  suffixIcon: Icons.calendar_today_rounded,
                  controller: _startingDate,
                  validator: (value) => customValidator(value),
                  onTap: () async {
                    DateTime? Pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2075));
                    if (Pickeddate != null) {
                      setState(() {
                        _startingDate.text =
                            DateFormat('dd-MM-yyyy').format(Pickeddate);
                      });
                    }
                  },
                  maxLength: 10,
                ),
                sizedbox,
                CustomTextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                  ],
                  labelText: 'Enter ending Date',
                  suffixIcon: Icons.calendar_today_rounded,
                  controller: _endingDate,
                  validator: (value) => customValidator(value),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2075),
                    );
                    if (pickedDate != null) {
                      if (_startingDate.text.isNotEmpty) {
                        DateTime startingDateTime =
                            DateFormat('dd-MM-yyyy').parse(_startingDate.text);
                        if (pickedDate.isAfter(startingDateTime)) {
                          setState(() {
                            _endingDate.text =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Ending date must be after starting date'),
                            ),
                          );
                        }
                      }
                    }
                  },
                  maxLength: 10,
                ),
                sizedbox,
                Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF355952),
                    ),
                    onPressed: () {
                      if (Formkey2.currentState!.validate()) {
                        onaddTripClicked();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenheight * 0.03,
                        horizontal: screenwidth * 0.05,
                      ),
                      child: const Text(
                        'ADD TRIP',
                        style: TextStyle(
                          color: Color(0xFFF3CD53),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onaddTripClicked() async {
    final _sname = _startingPoint.text.trim();
    final _ename = _destinationPoint.text.trim();
    final _budgets = _budget.text.trim();
    final _sdate = _startingDate.text.trim();
    final _edate = _endingDate.text.trim();

    if (_sname.isEmpty ||
        _ename.isEmpty ||
        _budgets.isEmpty ||
        _sdate.isEmpty ||
        _edate.isEmpty) {
      return;
    }
    // print('$_sname $_ename  $_budgets  $_sdate  $_edate ');
    final _trip = TripModel(
      startingPoint: _sname,
      endingingPoint: _ename,
      budget: _budgets,
      startingDate: _sdate,
      endingingDate: _edate,
    );

    DateTime startingDateTime = DateFormat('dd-MM-yyyy').parse(_sdate);
    if (startingDateTime.isBefore(DateTime.now())) {
      addOngoingTrip(_trip);
    } else {
      addUpcomingTrip(_trip);
    }

    // _startingPoint.clear();
    // _destinationPoint.clear();
    // _budget.clear();
    // _startingDate.clear();
    // _endingDate.clear();
  }
}
