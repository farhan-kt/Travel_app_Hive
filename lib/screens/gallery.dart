import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app/db/functions/db_functions.dart';
import 'package:travel_app/db/model/data_model.dart';
import 'package:travel_app/widgets/galleryexp.dart';
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
          backgroundColor: Color(0xFF355952),
          centerTitle: true,
          title: const Text('SUCCESSFUL TRIPS',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFFF3CD53))),
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
                  Container(
                    height: screenheight * 0.26,
                    width: MediaQuery.of(context).size.width * 0.97,
                    child: ValueListenableBuilder(
                      valueListenable: successTripsListNotifier,
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
                                  child: SuccessfulWidget(
                                    date: data.startingDate,
                                    place: data.endingingPoint,
                                    image: data.image,
                                    end_date: data.endingDate,
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return GalleryExp();
                                      },
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
