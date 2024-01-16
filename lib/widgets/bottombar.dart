import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/bottom_provider.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/view/trip_add.dart';
import 'package:travel_app/view/expence.dart';
import 'package:travel_app/view/gallery.dart';
import 'package:travel_app/view/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// class ScreenBtm extends StatelessWidget {
//   ScreenBtm({super.key});

//   final _screens = [
//     const ScreenHome(),
//     ScreenAdd(),
//     ScreenExp(),
//     const ScreenGallery()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final bottomProvider = Provider.of<BottomProvider>(context, listen: false);
//     return Scaffold(
//       body: Consumer<BottomProvider>(
//           builder: (context, value, child) =>
//               _screens[value.currentSelectedIndex]),
//       bottomNavigationBar: Container(
//         color: GreenColor.green,
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: GNav(
//             onTabChange: (newIndex) {
//               bottomProvider.changeBottom(newIndex);
//             },
//             backgroundColor: GreenColor.green,
//             color: Colors.white,
//             activeColor: Colors.black,
//             tabBackgroundColor: const Color.fromARGB(255, 223, 203, 138),
//             padding: const EdgeInsets.all(16),
//             gap: 10,
//             tabs: const [
//               GButton(
//                 icon: Icons.home_outlined,
//                 text: 'HOME',
//               ),
//               GButton(
//                 icon: Icons.add_box_outlined,
//                 text: 'ADD',
//               ),
//               GButton(
//                 icon: Icons.payment_outlined,
//                 text: 'EXPENSES',
//               ),
//               GButton(
//                 icon: Icons.photo_size_select_actual_outlined,
//                 text: 'GALLERY',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class ScreenBtm extends StatelessWidget {
  ScreenBtm({super.key});

  final List<Widget> _screens = [
    const ScreenHome(),
    ScreenAdd(),
    ScreenExp(),
    const ScreenGallery(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomProvider>(context, listen: false);

    return Scaffold(
      body: Consumer<BottomProvider>(
        builder: (context, value, child) =>
            _screens[value.currentSelectedIndex],
      ),
      bottomNavigationBar: Container(
        color: GreenColor.green,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GNav(
            onTabChange: (newIndex) {
              bottomProvider.changeBottom(newIndex);
            },
            backgroundColor: GreenColor.green,
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: const Color.fromARGB(255, 223, 203, 138),
            padding: const EdgeInsets.all(16),
            gap: 10,
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'HOME',
              ),
              GButton(
                icon: Icons.add_box_outlined,
                text: 'ADD',
              ),
              GButton(
                icon: Icons.payment_outlined,
                text: 'EXPENSES',
              ),
              GButton(
                icon: Icons.photo_size_select_actual_outlined,
                text: 'GALLERY',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
