import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/tripprovider.dart';
import 'package:travel_app/functions/exp_functions.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/model/trip_model/trip_model.dart';
import 'package:travel_app/widgets/edit.dart';
import 'package:travel_app/widgets/ongoingexp.dart';

class OngoingDetails extends StatelessWidget {
  final int id;
  final TripModel trip;

  const OngoingDetails({super.key, required this.trip, required this.id});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenColor.green,
        centerTitle: true,
        title: Text(
          trip.endingingPoint,
          style: const TextStyle(color: YellowColor.yellow),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Edit(
                        des: trip.endingingPoint,
                        endDate: trip.endingDate,
                        budget: trip.budget,
                        strt: trip.startingPoint,
                        id: id,
                        trip: trip,
                      );
                    });
              },
              icon: const Icon(Icons.edit, color: Colors.white)),
          IconButton(
              onPressed: () {
                Provider.of<TripProvider>(context, listen: false)
                    .deleteTrip(id);
                deleteAllExp();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete, color: Colors.red))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  width: 4,
                  color: Colors.grey,
                ),
                image: DecorationImage(
                  image: FileImage(File(trip.image)),
                  fit: BoxFit.fill,
                ),
              ),
              height: screenHeight * 0.3,
              width: screenWidth * double.infinity,
            ),
            const SizedBox(height: 30),
            Container(
              width: screenWidth * 0.9,
              decoration: const BoxDecoration(
                color: GreenColor.green,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: ListTile(
                textColor: YellowColor.yellow,
                title: const Text(
                  'Starting date',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  trip.startingDate,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Ending date',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      trip.endingDate,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.09,
              decoration: const BoxDecoration(
                color: GreenColor.green,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "TRIP BUDGET :",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '₹ ${trip.budget}',
                    style: const TextStyle(
                      color: YellowColor.yellow,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const OngoingExp(),
          ],
        ),
      ),
    );
  }
}
