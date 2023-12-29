import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/db/functions/db_functions.dart';
import 'package:travel_app/db/functions/exp_functions.dart';
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
              setState(() {
                deleteAllTrip();
                Navigator.pop(context);
              });

              deleteAllExp();
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
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ScreenLogin()),
        (route) => false);
  }
}
