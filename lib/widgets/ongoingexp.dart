import 'package:flutter/material.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/screens/expence.dart';

class OngoingExp extends StatefulWidget {
  const OngoingExp({super.key});

  @override
  State<OngoingExp> createState() => _OngoingExpState();
}

class _OngoingExpState extends State<OngoingExp> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.15,
      width: mediaQuery.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 4),
        color: GreenColor.green,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ScreenExp()));
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 5),
                Text('TRIP EXPENCES',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.white)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Tap to View',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
