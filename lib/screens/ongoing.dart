import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travel_app/db/functions/db_functions.dart';
import 'package:travel_app/db/model/data_model.dart';

import 'package:travel_app/widgets/edit.dart';
import 'package:travel_app/widgets/ongoingexp.dart';

class OngoingDetails extends StatefulWidget {
  final int id;
  final TripModel trip;

  const OngoingDetails({Key? key, required this.trip, required this.id})
      : super(key: key);

  @override
  State<OngoingDetails> createState() => _OngoingDetailsState();
}

class _OngoingDetailsState extends State<OngoingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF355952),
        centerTitle: true,
        title: Text(
          widget.trip.endingingPoint,
          style: const TextStyle(color: Color(0xFFF3CD53)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Edit(
                        des: widget.trip.endingingPoint,
                        endDate: widget.trip.endingingDate,
                        budget: widget.trip.budget,
                        strt: widget.trip.startingPoint,
                        id: widget.id,
                        trip: widget.trip,
                      );
                    });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                if (widget.id != null) {
                  deleteTrip(widget.id!);
                  Navigator.pop(context);
                } else {
                  print('Trip id is null');
                }
              },
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
                  color: Colors.grey,
                ),
                image: DecorationImage(
                  image: FileImage(File(widget.trip.image)),
                  fit: BoxFit.fill,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * double.infinity,
            ),
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Color(0xFF355952),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: ListTile(
                textColor: const Color(0xFFF3CD53),
                title: const Text(
                  'Starting date',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
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
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      widget.trip.endingingDate,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.09,
              decoration: const BoxDecoration(
                color: Color(0xFF355952),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 20),
            const OngoingExp(),
          ],
        ),
      ),
    );
  }
}
