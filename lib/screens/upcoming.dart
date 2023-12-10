import 'package:flutter/material.dart';
import 'package:travel_app/db/model/data_model.dart';
import 'package:travel_app/screens/bottombar.dart';

class UpcomingDetails extends StatefulWidget {
  final TripModel trip;

  const UpcomingDetails({Key? key, required this.trip}) : super(key: key);

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
              (route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          widget.trip.endingingPoint,
          style:
              TextStyle(color: Color(0xFFF3CD53), fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: screenHeight * 0.4,
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border:
                        Border.all(color: const Color(0xFFF3CD53), width: 4),
                    image: DecorationImage(
                      image: AssetImage(widget.trip.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF355952),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: ListTile(
                  textColor: const Color(0xFFF3CD53),
                  title: const Text(
                    'Starting date',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(
                    widget.trip.startingDate,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Ending date',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                      Text(
                        widget.trip.endingingDate,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: const Color(0xFF355952),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      const Text(
                        "TRIP BUDGET :",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '₹ ${widget.trip.budget}',
                        style: const TextStyle(
                          color: Color(0xFFF3CD53),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
