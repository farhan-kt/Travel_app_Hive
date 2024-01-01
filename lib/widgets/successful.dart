import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travel_app/helper/colors.dart';

class SuccessfulWidget extends StatelessWidget {
  final String date;
  final String end_date;
  final String place;
  final String image;

  const SuccessfulWidget({
    super.key,
    required this.date,
    required this.place,
    required this.image,
    required this.end_date,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: 200,
          margin: const EdgeInsets.only(right: 10),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              width: 2,
              color: GreenColor.green,
            ),
            image: DecorationImage(
              image: FileImage(File(image)),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: screenWidth * 0.028,
          top: screenHeight * 0.17,
          child: Text(
            place,
            style: const TextStyle(
              color: Color.fromARGB(255, 223, 19, 19),
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.20,
          left: screenWidth * 0.03,
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month_sharp,
                color: Color.fromARGB(255, 173, 37, 37),
                size: 13,
              ),
              const SizedBox(width: 4),
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 173, 37, 37),
                  fontSize: 13,
                ),
              ),
              const Text(
                ' - ',
                style: TextStyle(
                  color: Color.fromARGB(255, 223, 19, 19),
                  fontSize: 13,
                ),
              ),
              const Icon(
                Icons.calendar_month_sharp,
                color: Color.fromARGB(255, 173, 37, 37),
                size: 13,
              ),
              const SizedBox(width: 4),
              Text(
                end_date,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 173, 37, 37),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
