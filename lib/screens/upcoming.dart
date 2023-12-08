import 'package:flutter/material.dart';
import 'package:travel_app/db/model/data_model.dart';
import 'package:travel_app/screens/bottombar.dart';

class UpcomingDetails extends StatefulWidget {
  const UpcomingDetails({super.key, required TripModel trip});

  @override
  State<UpcomingDetails> createState() => _UpcomingDetailsState();
}

class _UpcomingDetailsState extends State<UpcomingDetails> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF355952),
        leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenBtm()),
                  (route) => false);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text(
          'Upcoming Trip Name',
          style:
              TextStyle(color: Color(0xFFF3CD53), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: Colors.red,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border:
                        Border.all(color: const Color(0xFFF3CD53), width: 4),
                    image: const DecorationImage(
                        image: AssetImage('assets/wayanad.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF355952),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const ListTile(
                  textColor: Color(0xFFF3CD53),
                  title: Text('Starting date',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
                  subtitle: Text(
                    '08/01/2024',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Ending date',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '10/01/2024',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                    color: Color(0xFF355952),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        "TRIP BUDGET :",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '₹2000',
                        style: TextStyle(
                            color: Color(0xFFF3CD53),
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
