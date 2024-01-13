// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/controller/expense_provider.dart';
import 'package:travel_app/functions/exp_functions.dart';
import 'package:travel_app/screens/appinfo.dart';
import 'package:travel_app/screens/login.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmuOP36y9V49K-07Ni5JpYMa9DsYBIAeuGDH0hiyBwExivwYz_zT7tMflEiISwk6ABxEI&usqp=CAU'),
                  fit: BoxFit.cover),
            ),
            child: Row(
              children: [
                Icon(Icons.settings),
                Text(
                  'SETTINGS',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('App Info'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AppInfo()));
            },
            trailing: const Icon(
              Icons.info_outline,
            ),
          ),
          ListTile(
            title: const Text('Clear Data'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Clear Data'),
                    content:
                        const Text('Are you sure you want to clear all data ?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            // deleteAllTrip();
                            Provider.of<ExpenseProvider>(context, listen: false)
                                .getAllExp();
                          });
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text('CLEAR'),
                      ),
                    ],
                  );
                },
              );
            },
            trailing: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          ListTile(
            title: const Text(
              'Log Out',
              style: TextStyle(color: Colors.red),
            ),
            trailing: const Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            onTap: () {
              signOut(context);
            },
          ),
        ],
      ),
    );
  }

  signOut(BuildContext ctx) async {
    final logoutSharedPref = await SharedPreferences.getInstance();
    await logoutSharedPref.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ScreenLogin()),
        (route) => false);
  }
}
