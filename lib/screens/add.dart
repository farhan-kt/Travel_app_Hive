import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/db/functions/db_functions.dart';
import 'package:travel_app/db/model/data_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/widgets/bottombar.dart';
import 'package:travel_app/widgets/textformfield.dart';

class ScreenAdd extends StatefulWidget {
  const ScreenAdd({super.key});

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

  File? selectedimage;

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
        backgroundColor: GreenColor.green,
        centerTitle: true,
        title: const Text(
          'ADD TRIP DETAILS',
          style:
              TextStyle(color: YellowColor.yellow, fontWeight: FontWeight.bold),
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
                  onTap: () {
                    fromgallery();
                  },
                  child: Container(
                    height: screenheight * 0.3,
                    width: screenwidth * double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: Colors.grey, width: 3),
                      image: selectedimage != null
                          ? DecorationImage(
                              image: FileImage(selectedimage!),
                              fit: BoxFit.fill,
                            )
                          : null,
                    ),
                    child: selectedimage == null
                        ? Center(
                            child: Lottie.asset(
                              'assets/Animation - addimage.json',
                              fit: BoxFit.fill,
                            ),
                          )
                        : null,
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
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
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
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: CustomTextFormField(
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
                                  DateFormat('dd-MM-yyyy')
                                      .parse(_startingDate.text);
                              if (pickedDate.isAfter(startingDateTime)) {
                                setState(() {
                                  _endingDate.text = DateFormat('dd-MM-yyyy')
                                      .format(pickedDate);
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
                    ),
                  ],
                ),
                sizedbox,
                Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: GreenColor.green,
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
                          color: YellowColor.yellow,
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
    final sname = _startingPoint.text.trim();
    final ename = _destinationPoint.text.trim();
    final budgets = _budget.text.trim();
    final sdate = _startingDate.text.trim();
    final edate = _endingDate.text.trim();

    if (sname.isEmpty ||
        ename.isEmpty ||
        budgets.isEmpty ||
        sdate.isEmpty ||
        edate.isEmpty) {
      return;
    }

    final trip = TripModel(
      image: selectedimage!.path,
      startingPoint: sname,
      endingingPoint: ename,
      budget: budgets,
      startingDate: sdate,
      endingDate: edate,
    );

    await addTrip(trip);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        'Trip Added Successfully',
      ),
      behavior: SnackBarBehavior.floating,
    ));

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const ScreenBtm()),
      (route) => false,
    );
  }

  fromgallery() async {
    final returnedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedimage = File(returnedimage!.path);
    });
  }
}
