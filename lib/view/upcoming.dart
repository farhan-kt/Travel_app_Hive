import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/trip_provider.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/model/trip_model/trip_model.dart';
import 'package:travel_app/widgets/bottombar.dart';

class UpcomingDetails extends StatelessWidget {
  final TripModel trip;
  final int id;

  const UpcomingDetails({super.key, required this.trip, required this.id});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    final upcomingProvider = Provider.of<TripProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenColor.green,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ScreenBtm()),
              (route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          trip.endingingPoint,
          style: const TextStyle(
              color: YellowColor.yellow, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (trip.id != null) {
                upcomingProvider.deleteTrip(id);
                Navigator.pop(context);
                upcomingProvider.getAllTrip();
              }
            },
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: YellowColor.yellow, width: 4),
                    image: DecorationImage(
                      image: FileImage(File(trip.image)),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: mediaQuery.height * 0.3,
                  width: mediaQuery.width * double.infinity,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: const BoxDecoration(
                  color: GreenColor.green,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: ListTile(
                  textColor: YellowColor.yellow,
                  title: const Text(
                    'Starting date',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
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
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        trip.endingDate,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: mediaQuery.width * 0.8,
                height: mediaQuery.height * 0.1,
                decoration: const BoxDecoration(
                  color: GreenColor.green,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
