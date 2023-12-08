import 'package:flutter/material.dart';
import 'package:travel_app/db/model/data_model.dart';

ValueNotifier<List<TripModel>> ongoingTripsListNotifier = ValueNotifier([]);
ValueNotifier<List<TripModel>> upcomingTripsListNotifier = ValueNotifier([]);

void addOngoingTrip(TripModel value) {
  ongoingTripsListNotifier.value.add(value);
  ongoingTripsListNotifier.notifyListeners();
  print(value.toString());
}

void addUpcomingTrip(TripModel value) {
  upcomingTripsListNotifier.value.add(value);
  upcomingTripsListNotifier.notifyListeners();
  print(value.toString());
}
