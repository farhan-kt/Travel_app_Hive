import 'package:flutter/material.dart';
import 'package:travel_app/helper/colors.dart';

class GalleryExp extends StatelessWidget {
  const GalleryExp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GreenColor.green,
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 1,
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            border: Border.all(color: YellowColor.yellow, width: 4),
            color: GreenColor.green,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TOTAL EXPENCES : ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              Text(
                ' ₹ 1000',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: YellowColor.yellow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
