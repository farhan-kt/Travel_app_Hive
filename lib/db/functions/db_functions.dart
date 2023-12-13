import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/db/model/data_model.dart';

ValueNotifier<List<TripModel>> ongoingTripsListNotifier = ValueNotifier([]);
ValueNotifier<List<TripModel>> upcomingTripsListNotifier = ValueNotifier([]);

Future<void> addOngoingTrip(TripModel value) async {
  final tripDB = await Hive.openBox<TripModel>('trip_db');

  final _onId = await tripDB.add(value);
  value.id = _onId;
  ongoingTripsListNotifier.value.add(value);

  ongoingTripsListNotifier.notifyListeners();
}

Future<void> addUpcomingTrip(TripModel value) async {
  final tripDB = await Hive.openBox<TripModel>('trip_db');

  final _upId = await tripDB.add(value);
  value.id = _upId;

  upcomingTripsListNotifier.value.add(value);

  upcomingTripsListNotifier.notifyListeners();
}

Future<void> getAllTrip() async {
  final tripDB = await Hive.openBox<TripModel>('trip_db');
  ongoingTripsListNotifier.value.clear();
  upcomingTripsListNotifier.value.clear();

  final List<TripModel> allTrips = tripDB.values.toList();

  for (TripModel trip in allTrips) {
    if (isTripOngoing(trip)) {
      ongoingTripsListNotifier.value.add(trip);
    } else {
      upcomingTripsListNotifier.value.add(trip);
    }
  }

  ongoingTripsListNotifier.notifyListeners();
  upcomingTripsListNotifier.notifyListeners();
}

bool isTripOngoing(TripModel trip) {
  DateTime startingDateTime = DateFormat('dd-MM-yyyy').parse(trip.startingDate);
  return startingDateTime.isBefore(DateTime.now());
}

Future<void> deleteTrip(int id) async {
  final tripDB = await Hive.openBox<TripModel>('trip_db');
  tripDB.delete(id);
  getAllTrip();
}

// import 'dart:async';

// ValueNotifier<List<TripModel>> ongoingTripsListNotifier = ValueNotifier([]);
// ValueNotifier<List<TripModel>> upcomingTripsListNotifier = ValueNotifier([]);

// Future<void> addOngoingTrip(TripModel value) async {
//   final tripDB = await Hive.openBox<TripModel>('trip_db');
//   final _onId = await tripDB.add(value);
//   value.id = _onId;
//   ongoingTripsListNotifier.value.add(value);
//   ongoingTripsListNotifier.notifyListeners();
// }

// Future<void> addUpcomingTrip(TripModel value) async {
//   final tripDB = await Hive.openBox<TripModel>('trip_db');
//   final _upId = await tripDB.add(value);
//   value.id = _upId;
//   upcomingTripsListNotifier.value.add(value);
//   upcomingTripsListNotifier.notifyListeners();
// }

// Future<void> getAllTrip() async {
//   final tripDB = await Hive.openBox<TripModel>('trip_db');

//   _checkAndUpdateTrips();

//   Timer.periodic(const Duration(minutes: 1), (Timer timer) {
//     _checkAndUpdateTrips();
//   });
// }

// void _checkAndUpdateTrips() {
//   final tripDB = Hive.box<TripModel>('trip_db');
//   final now = DateTime.now();

//   List<TripModel> allTrips = tripDB.values.toList();

//   List<TripModel> ongoingTrips = allTrips.where((trip) {
//     final tripStartDate = DateTime.parse(trip.startingDate);
//     return tripStartDate.isBefore(now);
//   }).toList();

//   List<TripModel> upcomingTrips = allTrips.where((trip) {
//     final tripStartDate = DateTime.parse(trip.startingDate);
//     return tripStartDate.isAfter(now);
//   }).toList();

//   for (final trip in upcomingTrips) {
//     final tripStartDate = DateTime.parse(trip.startingDate);
//     if (tripStartDate.isBefore(now)) {
//       ongoingTrips.add(trip);
//       upcomingTrips.remove(trip);
//     }
//   }

//   ongoingTripsListNotifier.value = ongoingTrips;
//   upcomingTripsListNotifier.value = upcomingTrips;

//   ongoingTripsListNotifier.notifyListeners();
//   upcomingTripsListNotifier.notifyListeners();
// }

// Future<void> deleteStudent(int id) async {
//   final tripDB = await Hive.openBox<TripModel>('trip_db');
//   tripDB.delete(id);
// }
