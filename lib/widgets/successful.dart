import 'package:flutter/material.dart';

class SuccessfulWidget extends StatelessWidget {
  final String date;
  final String end_date;
  final String place;
  final String image;

  SuccessfulWidget({
    Key? key,
    required this.date,
    required this.place,
    required this.image,
    required this.end_date,
  }) : super(key: key);

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
              color: const Color(0xFF355952),
            ),
            image: const DecorationImage(
              image: AssetImage('assets/wayanad.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: screenWidth * 0.028,
          top: screenHeight * 0.22,
          child: Text(
            place,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.25,
          left: screenWidth * 0.03,
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month_sharp,
                color: Colors.white,
                size: 13,
              ),
              const SizedBox(width: 4),
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              Text(
                ' - ',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              const Icon(
                Icons.calendar_month_sharp,
                color: Colors.white,
                size: 13,
              ),
              const SizedBox(width: 4),
              Text(
                end_date,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
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
