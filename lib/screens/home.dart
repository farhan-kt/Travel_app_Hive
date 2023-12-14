import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/db/functions/db_functions.dart';
import 'package:travel_app/db/model/data_model.dart';
import 'package:travel_app/screens/ongoing.dart';
import 'package:travel_app/screens/upcoming.dart';
import 'package:travel_app/widgets/navbar.dart';
import 'package:travel_app/widgets/ongoingtrip.dart';
import 'package:travel_app/widgets/upcoming.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    getAllTrip();

    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF355952),
        centerTitle: true,
        title: const Text('HOME',
            style: TextStyle(
                color: Color(0xFFF3CD53), fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search for trips...',
                      hintStyle: const TextStyle(color: Color(0xFFF3CD53)),
                      filled: true,
                      fillColor: const Color(0xFF355952),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'ONGOING TRIP',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: screenheight * 0.26,
                    width: MediaQuery.of(context).size.width * 0.97,
                    child: ValueListenableBuilder(
                      valueListenable: ongoingTripsListNotifier,
                      builder: (BuildContext ctx, List<TripModel> tripList,
                          Widget? child) {
                        print('Build with ${tripList.length}');
                        if (tripList.isNotEmpty) {
                          return ListView.builder(
                            itemCount: tripList.isNotEmpty ? 1 : 0,
                            itemBuilder: (ctx, index) {
                              final data = tripList[index];
                              return Container(
                                height: screenheight * 0.24,
                                width: MediaQuery.of(context).size.width * 0.97,
                                child: InkWell(
                                  child: OngoingWidget(
                                    date: data.startingDate,
                                    place: data.endingingPoint,
                                    image: data.image,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OngoingDetails(
                                          id: index,
                                          trip: data,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        } else {
                          return Container(
                            height: screenheight * 0.6,
                            width: MediaQuery.of(context).size.width * 0.97,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
                            child: tripList.isNotEmpty
                                ? Image.file(
                                    File(tripList.first.image),
                                    fit: BoxFit.cover,
                                  )
                                : Lottie.asset(
                                    'assets/Animation - 1702390293591.json',
                                    fit: BoxFit.fill),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'UPCOMING TRIP',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: screenheight * 0.26,
                    width: MediaQuery.of(context).size.width * 0.97,
                    child: ValueListenableBuilder(
                      valueListenable: upcomingTripsListNotifier,
                      builder: (BuildContext ctx, List<TripModel> tripList,
                          Widget? child) {
                        print('Build with ${tripList.length}');
                        if (tripList.isNotEmpty) {
                          return ListView.separated(
                            itemCount: tripList.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 8),
                            itemBuilder: (ctx, index) {
                              final data = tripList[index];
                              return Container(
                                height: screenheight * 0.24,
                                width: MediaQuery.of(context).size.width * 0.97,
                                child: InkWell(
                                  child: UpcomingWidget(
                                    date: data.startingDate,
                                    place: data.endingingPoint,
                                    image: data.image,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UpcomingDetails(
                                          trip: data,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        } else {
                          return Container(
                            height: screenheight * 0.24,
                            width: MediaQuery.of(context).size.width * 0.97,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                width: 2,
                                color: Colors.grey,
                              ),
                            ),
                            child: Lottie.asset(
                                'assets/Animation - 1702390293591.json',
                                fit: BoxFit.fill),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
