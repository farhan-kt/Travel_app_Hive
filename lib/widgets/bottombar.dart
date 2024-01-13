import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/bottomprovider.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/screens/add.dart';
import 'package:travel_app/screens/expence.dart';
import 'package:travel_app/screens/gallery.dart';
import 'package:travel_app/screens/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ScreenBtm extends StatelessWidget {
  ScreenBtm({super.key});

  final _screens = [
    const ScreenHome(),
    ScreenAdd(),
    ScreenExp(),
    const ScreenGallery()
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomProvider>(context);
    return Scaffold(
      body: _screens[bottomProvider.currentSelectedIndex],
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
