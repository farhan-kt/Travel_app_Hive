import 'package:flutter/material.dart';
import 'package:travel_app/helper/colors.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: GreenColor.green,
        title: const Text(
          'App Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Traverse',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                  'Traverse App is a offline app designed to help plan and manage trip. It provides a user-friendly interface and a features to make travel experience enjoyable.'),
            ),
            Text('Key Features', style: TextStyle(fontWeight: FontWeight.w900)),
            SizedBox(height: 10),
            Text(
              'Trip Orientation & Details',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            Text(
                'Effortessly categorize trip into ongoing, upcoming and recent for better organization and planning. Add trip name,destination,dates and cover image for a comprehensive trip overview '),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text('Expenses',
                  style: TextStyle(fontWeight: FontWeight.w700)),
            ),
            Text('This app is also useful for track expenses'),
            SizedBox(height: 10),
            Text('Made in India', style: TextStyle(fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
