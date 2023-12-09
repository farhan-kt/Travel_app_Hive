import 'package:flutter/material.dart';

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
            border: Border.all(color: const Color(0xFF355952), width: 2),
            image: DecorationImage(
              image: AssetImage(image),
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
              color: Color.fromARGB(255, 36, 5, 5),
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
                color: Color.fromARGB(255, 153, 52, 52),
                size: 12,
              ),
              const SizedBox(width: 4),
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 174, 39, 39),
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
