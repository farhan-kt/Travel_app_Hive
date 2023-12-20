import 'package:flutter/material.dart';
import 'package:travel_app/helper/colors.dart';

class Expenses extends StatelessWidget {
  final String money;
  final String category;
  final IconData icons;
  const Expenses(
      {super.key,
      required this.money,
      required this.category,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.37,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: YellowColor.yellow, width: 3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(money,
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(category,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 16)),
                Icon(
                  icons,
                  size: 23,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
