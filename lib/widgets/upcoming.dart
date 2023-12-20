import 'package:flutter/material.dart';
import 'dart:io';

import 'package:travel_app/helper/colors.dart';

class UpcomingWidget extends StatelessWidget {
  final String date;
  final String place;
  final String image;

  const UpcomingWidget({
    Key? key,
    required this.date,
    required this.place,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: GreenColor.green, width: 2),
            image: DecorationImage(
              image: FileImage(File(image)),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.17,
          left: 10,
          child: Text(
            place,
            style: const TextStyle(
              color: Color.fromARGB(255, 223, 19, 19),
              fontWeight: FontWeight.w900,
              fontSize: 14,
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.195,
          left: 10,
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month_sharp,
                color: Color.fromARGB(255, 173, 37, 37),
                size: 12,
              ),
              const SizedBox(width: 4),
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 173, 37, 37),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
