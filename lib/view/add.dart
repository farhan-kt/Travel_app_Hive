// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/addprovider.dart';
import 'package:travel_app/controller/tripprovider.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/model/trip_model/trip_model.dart';
import 'package:travel_app/widgets/textformfield.dart';

class ScreenAdd extends StatelessWidget {
  final formKey2 = GlobalKey<FormState>();
  ScreenAdd({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var sizedBox = const SizedBox(height: 10);
    final addprov = Provider.of<AddProvider>(context, listen: false);

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
            key: formKey2,
            child: Column(
              children: [
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    addprov.fromgallery();
                  },
                  child:
                      Consumer<AddProvider>(builder: (context, value, child) {
                    return Container(
                      height: screenHeight * 0.3,
                      width: screenWidth * double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Colors.grey, width: 3),
                        image: value.selectedimage != null
                            ? DecorationImage(
                                image: FileImage(value.selectedimage!),
                                fit: BoxFit.fill,
                              )
                            : null,
                      ),
                      child: value.selectedimage == null
                          ? Center(
                              child: Lottie.asset(
                                'assets/Animation - addimage.json',
                                fit: BoxFit.fill,
                              ),
                            )
                          : null,
                    );
                  }),
                ),
                sizedBox,
                CustomTextFormField(
                  labelText: 'Enter starting Point',
                  suffixIcon: Icons.location_on,
                  controller: addprov.startingPoint,
                ),
                sizedBox,
                CustomTextFormField(
                  labelText: 'Enter Destination',
                  suffixIcon: Icons.location_on,
                  controller: addprov.destinationPoint,
                ),
                sizedBox,
                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  labelText: 'Enter Budget',
                  suffixIcon: Icons.currency_rupee_sharp,
                  controller: addprov.budget,
                  maxLength: 8,
                ),
                sizedBox,
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
                        ],
                        labelText: 'Enter starting Date',
                        suffixIcon: Icons.calendar_today_rounded,
                        controller: addprov.startingDate,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2075));
                          if (pickedDate != null) {
                            addprov.startingDate.text =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
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
                        controller: addprov.endingDate,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2075),
                          );
                          if (pickedDate != null) {
                            if (addprov.startingDate.text.isNotEmpty) {
                              DateTime startingDateTime =
                                  DateFormat('dd-MM-yyyy')
                                      .parse(addprov.startingDate.text);
                              if (pickedDate.isAfter(startingDateTime)) {
                                addprov.endingDate.text =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
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
                sizedBox,
                Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: GreenColor.green,
                    ),
                    onPressed: () {
                      if (formKey2.currentState!.validate()) {
                        onaddTripClicked(context);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.03,
                        horizontal: screenWidth * 0.05,
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

  Future<void> onaddTripClicked(context) async {
    final addProvider = Provider.of<AddProvider>(context, listen: false);
    final sname = addProvider.startingPoint.text.trim();
    final ename = addProvider.destinationPoint.text.trim();
    final budgets = addProvider.budget.text.trim();
    final sdate = addProvider.startingDate.text.trim();
    final edate = addProvider.endingDate.text.trim();

    if (sname.isEmpty ||
        ename.isEmpty ||
        budgets.isEmpty ||
        sdate.isEmpty ||
        edate.isEmpty) {
      return;
    }

    final trip = TripModel(
      image: addProvider.selectedimage!.path,
      startingPoint: sname,
      endingingPoint: ename,
      budget: budgets,
      startingDate: sdate,
      endingDate: edate,
    );

    await Provider.of<TripProvider>(context, listen: false).addTrip(trip);
    addProvider.startingPoint.clear();
    addProvider.destinationPoint.clear();
    addProvider.budget.clear();
    addProvider.startingDate.clear();
    addProvider.endingDate.clear();
    addProvider.selectedimage = null;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        'Trip Added Successfully',
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
