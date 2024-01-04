import 'package:flutter/material.dart';
import 'package:travel_app/helper/colors.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var sizedBox = const SizedBox(height: 10);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GreenColor.green,
        title: const Text(
          'App Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Traverse',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                  'Traverse App is a offline app designed to help plan and manage trip. It provides a user-friendly interface and a features to make travel experience enjoyable.'),
            ),
            const Text('Key Features',
                style: TextStyle(fontWeight: FontWeight.w900)),
            sizedBox,
            const Text(
              'Trip Orientation & Details',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            sizedBox,
            const Text(
                'Effortessly categorize trip into ongoing, upcoming and recent for better organization and planning. Add trip name,destination,dates and cover image for a comprehensive trip overview '),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text('Expenses',
                  style: TextStyle(fontWeight: FontWeight.w700)),
            ),
            const Text('This app is also useful for track expenses'),
            sizedBox,
            const Text('Made in India',
                style: TextStyle(fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
