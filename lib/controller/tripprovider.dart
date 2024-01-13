import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/trip_model/trip_model.dart';
import 'package:travel_app/service/trip_service.dart';

class TripProvider extends ChangeNotifier {
  List<TripModel> ongoingTrip = [];
  List<TripModel> upcomingTrip = [];
  List<TripModel> successTrip = [];
  TripService tripservice = TripService();
  DateTime now = DateTime.now();

  Future<void> getAllTrip() async {
    final List<TripModel> allTrips = await tripservice.getAllTrip();

    ongoingTrip.clear();
    upcomingTrip.clear();
    successTrip.clear();

    for (TripModel trip in allTrips) {
      DateTime startingDateTime =
          DateFormat('dd-MM-yyyy').parse(trip.startingDate).toLocal();
      DateTime endingDateTime =
          DateFormat('dd-MM-yyyy').parse(trip.endingDate).toLocal();

      if (endingDateTime.isBefore(now)) {
        successTrip.add(trip);
      } else if (startingDateTime.isBefore(now) &&
          endingDateTime.isAfter(now)) {
        ongoingTrip.add(trip);
      } else {
        upcomingTrip.add(trip);
      }
    }
    notifyListeners();
  }

  Future<void> addTrip(TripModel value) async {
    DateTime startingDateTime =
        DateFormat('dd-MM-yyyy').parse(value.startingDate);
    DateTime endingDateTime = DateFormat('dd-MM-yyyy').parse(value.endingDate);

    if (endingDateTime.isBefore(now)) {
      successTrip.add(value);
    } else if (startingDateTime.isBefore(now) && endingDateTime.isAfter(now)) {
      ongoingTrip.add(value);
    } else {
      upcomingTrip.add(value);
    }

    int id = await tripservice.addTrip(value);
    value.id = id;
    notifyListeners();
  }

  Future<void> deleteTrip(int id) async {
    await tripservice.deleteTrip(id);
    await getAllTrip();
  }

  Future<void> editTrip(int id, TripModel value) async {
    await tripservice.updateTrip(value, id);
    await getAllTrip();
  }

  // Future<void> deleteAllTrip() async {
  //   await tripservice.deleteAllTrip();
  // await getAllTrip();
  // }
}
