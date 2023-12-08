import 'package:flutter/material.dart';
import 'package:travel_app/screens/splash.dart';

const SAVE_KEY = 'userLoggedin';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenSplash(),
    );
  }
}
