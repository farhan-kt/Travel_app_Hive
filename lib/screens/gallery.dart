import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF355952),
          centerTitle: true,
          title: const Text('SUCCESSFUL TRIPS',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFFF3CD53))),
          automaticallyImplyLeading: false),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    child: SuccessfulWidget(
                      date: '12/04/2023',
                      place: 'WAYANAD',
                      image: 'assets/wayanad.jpg',
                      end_date: '15/04/2023',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
