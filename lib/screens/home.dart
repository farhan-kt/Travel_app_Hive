import 'package:flutter/material.dart';
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
                    child: ValueListenableBuilder(
                      valueListenable: ongoingTripsListNotifier,
                      builder: (BuildContext ctx, List<TripModel> tripList,
                          Widget? child) {
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
                                    image: '',
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OngoingDetails(
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
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                width: 2,
                                color: Color(0xFF355952),
                              ),
                            ),
                            child:
                                Image(image: AssetImage('assets/no trip.png')),
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
                    child: ValueListenableBuilder(
                      valueListenable: upcomingTripsListNotifier,
                      builder: (BuildContext ctx, List<TripModel> tripList,
                          Widget? child) {
                        if (tripList.isNotEmpty) {
                          return ListView.builder(
                            itemCount: tripList.length,
                            itemBuilder: (ctx, index) {
                              final data = tripList[index];
                              return Container(
                                height: screenheight * 0.24,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: InkWell(
                                  child: UpcomingWidget(
                                    date: data.startingDate,
                                    place: data.endingingPoint,
                                    image: 'assets/upcoming.jpg',
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
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                width: 2,
                                color: Color(0xFF355952),
                              ),
                            ),
                            child: Image(
                                image: AssetImage('assets/default_image.png')),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
