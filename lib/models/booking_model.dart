import 'dart:collection';

import 'package:card2go/api/services.dart';
import 'package:card2go/views/destinations_view.dart';
import 'package:flutter/cupertino.dart';

class BookingModel extends ChangeNotifier {
  List<Booking> _bookings = [];
  UnmodifiableListView<Booking> get bookings => UnmodifiableListView(_bookings);

  BookingModel() {
    loadBookings();
  }

  void loadBookings() async {
    try {
      List<Booking> b = await BookingService.getBookings();
      for (Booking i in b) {
        add(i);
      }
    } catch (err) {
      print(err);
    }
  }

  void add(Booking booking) {
    _bookings.add(booking);
    notifyListeners();
  }

  void removeAll() {
    _bookings.clear();
    notifyListeners();
  }

  void remove(Booking booking) {
    _bookings.remove(booking);
    notifyListeners();
  }
}

class Booking {
  final int id;
  final DestinationData destination;
  final DateTime created;
  final DateTime on;
  final int tickets;
  final Package? package;

  Booking(
      {required this.created,
      required this.on,
      required this.id,
      required this.destination,
      required this.tickets,
      this.package});
}

class DestinationData {
  late final int id;
  late final String name;
  late final String description;

  DestinationData(
      {required this.id, required this.name, required this.description});

  DestinationData.from(Destination destination) {
    this.id = destination.id;
    this.name = destination.name;
    this.description = destination.description;
  }
}
