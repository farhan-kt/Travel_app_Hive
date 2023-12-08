import 'package:flutter/material.dart';
import 'package:travel_app/db/model/data_model.dart';
import 'package:travel_app/widgets/edit.dart';
import 'package:travel_app/widgets/ongoingexp.dart';

class OngoingDetails extends StatelessWidget {
  const OngoingDetails({super.key, required TripModel trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF355952),
        centerTitle: true,
        title: const Text(
          'Ongoing Trip Name',
          style: TextStyle(color: Color(0xFFF3CD53)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const Edit();
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.red))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  width: 4,
                  color: const Color(0xFF355952),
                ),
                image: const DecorationImage(
                    image: AssetImage('assets/ongoing.jpg'), fit: BoxFit.fill),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * double.infinity,
            ),
            const SizedBox(height: 30),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xFF355952),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const ListTile(
                textColor: Color(0xFFF3CD53),
                title: Text('Starting date',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                subtitle: Text("29/11/2023",
                    style: TextStyle(fontSize: 14, color: Colors.white)),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      'Ending date',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '23/12/2023',
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
                      '₹ 2000',
                      style: TextStyle(
                          color: Color(0xFFF3CD53),
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const OngoingExp(),
          ],
        ),
      ),
    );
  }
}
