import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/screens/bottombar.dart';
import 'package:lottie/lottie.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.4,
                width: double.infinity,
                child: Lottie.asset(
                  'assets/Animation - 1702389671540.json',
                  fit: BoxFit.fill,
                  width: screenWidth * 1,
                  height: screenHeight * 0.6,
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  height: screenHeight * 0.6,
                  width: double.infinity,
                  color: const Color(0xFF355952),
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Center(
                              child: Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Color(0xFFF3CD53),
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          )),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Value is empty';
                              } else {
                                return null;
                              }
                            },
                            controller: _nameController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'NAME',
                              labelStyle: TextStyle(color: Color(0xFFF3CD53)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Value is empty';
                              } else {
                                return null;
                              }
                            },
                            obscureText: true,
                            controller: _passwordController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(color: Color(0xFFF3CD53)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () {
                                checkLogin(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.03,
                                    horizontal: screenWidth * 0.05),
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Color(0xFF355952),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final _username = _nameController.text;
      final _password = _passwordController.text;
      if (_username == _password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ScreenBtm()),
        );
        final _sharedPrefs = await SharedPreferences.getInstance();
        await _sharedPrefs.setBool(SAVE_KEY, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Username and password do not match',
            style: TextStyle(color: Color(0xFF355952)),
          ),
          margin: EdgeInsets.all(8),
          duration: Duration(seconds: 3),
          backgroundColor: Color(0xFFF3CD53),
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }
}
