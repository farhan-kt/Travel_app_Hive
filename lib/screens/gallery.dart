import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/functions/db_functions.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/model/trip_model/data_model.dart';
import 'package:travel_app/widgets/gallerybottomsheet.dart';
import 'package:travel_app/widgets/successful.dart';

class ScreenGallery extends StatefulWidget {
  const ScreenGallery({super.key});

  @override
  State<ScreenGallery> createState() => _ScreenGalleryState();
}

class _ScreenGalleryState extends State<ScreenGallery> {
  @override
  Widget build(BuildContext context) {
    getAllTrip();
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: GreenColor.green,
          centerTitle: true,
          title: const Text('SUCCESSFUL TRIPS',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: YellowColor.yellow)),
          automaticallyImplyLeading: false),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenheight * 0.75,
                    width: MediaQuery.of(context).size.width * 0.97,
                    child: ValueListenableBuilder(
                      valueListenable: successTripsListNotifier,
                      builder: (BuildContext ctx, List<TripModel> tripList,
                          Widget? child) {
                        if (tripList.isNotEmpty) {
                          return Expanded(
                            child: ListView.separated(
                              itemCount: tripList.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              itemBuilder: (ctx, index) {
                                final data = tripList[index];
                                return SizedBox(
                                  height: screenheight * 0.24,
                                  width:
                                      MediaQuery.of(context).size.width * 0.97,
                                  child: InkWell(
                                    child: SuccessfulWidget(
                                      date: data.startingDate,
                                      place: data.endingingPoint,
                                      image: data.image,
                                      endDate: data.endingDate,
                                    ),
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return GalleryWidget(
                                            trip: data,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
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
