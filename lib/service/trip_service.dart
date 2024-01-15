import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/model/trip_model/trip_model.dart';

class TripService {
  Future getAllTrip() async {
    final tripDB = await Hive.openBox<TripModel>("trip_db");
    return tripDB.values.toList();
  }

  Future addTrip(TripModel value) async {
    final tripDB = await Hive.openBox<TripModel>('trip_db');
    return tripDB.add(value);
  }

  Future deleteTrip(int id) async {
    final tripDB = await Hive.openBox<TripModel>("trip_db");
    await tripDB.deleteAt(id);
  }

  Future updateTrip(TripModel value, id) async {
    final tripDB = await Hive.openBox<TripModel>("trip_db");
    await tripDB.putAt(id, value);
  }

  Future deleteAllTrip() async {
    final tripDB = await Hive.openBox<TripModel>("trip_db");
    await tripDB.clear();
  }
}
