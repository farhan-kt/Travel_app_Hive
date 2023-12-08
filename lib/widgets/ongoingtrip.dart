import 'package:flutter/material.dart';

class OngoingWidget extends StatelessWidget {
  final String date;
  final String place;

  const OngoingWidget({
    Key? key,
    required this.date,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              width: 2,
              color: Color(0xFF355952),
            ),
            // image: DecorationImage(
            //   image: AssetImage(image),
            //   fit: BoxFit.fill,
            // ),
          ),
        ),
        Positioned(
          left: screenWidth * 0.03,
          top: screenHeight * 0.18,
          child: Text(
            place,
            style: const TextStyle(
              color: Color.fromARGB(255, 218, 77, 77),
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.21,
          left: screenWidth * 0.03,
          child: Row(
            children: [
              const Icon(
                Icons.calendar_month_sharp,
                color: Color.fromARGB(255, 246, 67, 67),
                size: 15,
              ),
              const SizedBox(width: 4),
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 152, 32, 32),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
