import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/db/model/data_model.dart';

// ValueNotifier<List<TripModel>> ongoingTripsListNotifier = ValueNotifier([]);
// ValueNotifier<List<TripModel>> upcomingTripsListNotifier = ValueNotifier([]);

// Future<void> addOngoingTrip(TripModel value) async {
//   print('Before ongoing Box Opening');
//   final tripDB = await Hive.openBox<TripModel>('trip_db');
//   print('After ongoing Box Opening');
//   final _onId = await tripDB.add(value);
//   value.id = _onId;
//   ongoingTripsListNotifier.value.add(value);

//   ongoingTripsListNotifier.notifyListeners();
// }

// Future<void> addUpcomingTrip(TripModel value) async {
//   print('Before upgoing Box Opening');
//   final tripDB = await Hive.openBox<TripModel>('trip_db');
//   print('After upgoing Box Opening');
//   final _upId = await tripDB.add(value);
//   value.id = _upId;

//   upcomingTripsListNotifier.value.add(value);

//   upcomingTripsListNotifier.notifyListeners();
// }

// Future<void> getAllTrip() async {
//   final tripDB = await Hive.openBox<TripModel>('trip_db');

//   final allTrips = tripDB.values.toList();
//   final now = DateTime.now();

//   ongoingTripsListNotifier.value = allTrips.where((trip) {
//     final tripStartDate = DateTime.parse(trip.startingDate);
//     return tripStartDate.isBefore(now);
//   }).toList();
//   ongoingTripsListNotifier.notifyListeners();

//   upcomingTripsListNotifier.value = allTrips.where((trip) {
//     final tripStartDate = DateTime.parse(trip.startingDate);
//     return tripStartDate.isAfter(now);
//   }).toList();

//   upcomingTripsListNotifier.notifyListeners();
// }

// Future<void> deleteStudent(int id) async {
//   final tripDB = await Hive.openBox<TripModel>('trip_db');
//   tripDB.delete(id);
// }

import 'dart:async';

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

  _checkAndUpdateTrips();

  // Schedule a periodic task to check for upcoming trips
  Timer.periodic(const Duration(minutes: 1), (Timer timer) {
    _checkAndUpdateTrips();
  });
}

void _checkAndUpdateTrips() {
  final tripDB = Hive.box<TripModel>('trip_db');
  final now = DateTime.now();

  List<TripModel> allTrips = tripDB.values.toList();

  List<TripModel> ongoingTrips = allTrips.where((trip) {
    final tripStartDate = DateTime.parse(trip.startingDate);
    return tripStartDate.isBefore(now);
  }).toList();

  List<TripModel> upcomingTrips = allTrips.where((trip) {
    final tripStartDate = DateTime.parse(trip.startingDate);
    return tripStartDate.isAfter(now);
  }).toList();

  // Move upcoming trips to ongoing trips if their starting date has arrived
  for (final trip in upcomingTrips) {
    final tripStartDate = DateTime.parse(trip.startingDate);
    if (tripStartDate.isBefore(now)) {
      ongoingTrips.add(trip);
      upcomingTrips.remove(trip);
    }
  }

  // Update the lists
  ongoingTripsListNotifier.value = ongoingTrips;
  upcomingTripsListNotifier.value = upcomingTrips;

  // Notify the listeners
  ongoingTripsListNotifier.notifyListeners();
  upcomingTripsListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final tripDB = await Hive.openBox<TripModel>('trip_db');
  tripDB.delete(id);
}
