import 'package:flutter/material.dart';
import 'package:travel_app/helper/colors.dart';
import 'package:travel_app/screens/add.dart';
import 'package:travel_app/screens/expence.dart';
import 'package:travel_app/screens/gallery.dart';
import 'package:travel_app/screens/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ScreenBtm extends StatefulWidget {
  const ScreenBtm({super.key});

  @override
  State<ScreenBtm> createState() => _ScreenBtmState();
}

class _ScreenBtmState extends State<ScreenBtm> {
  int _currentSelectedIndex = 0;
  final _screens = [
    const ScreenHome(),
    const ScreenAdd(),
    const ScreenExp(),
    const ScreenGallery()
  ];

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size;
    return Scaffold(
      body: _screens[_currentSelectedIndex],
      bottomNavigationBar: Container(
        color: GreenColor.green,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GNav(
            onTabChange: (newIndex) {
              setState(() {
                _currentSelectedIndex = newIndex;
              });
            },
            backgroundColor: GreenColor.green,
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Color.fromARGB(255, 223, 203, 138),
            padding: EdgeInsets.all(16),
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
