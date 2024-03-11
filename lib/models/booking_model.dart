import 'dart:collection';

import 'package:flutter/cupertino.dart';

class BookingModel extends ChangeNotifier {
  List<Booking> _bookings = [];
  UnmodifiableListView<Booking> get bookings => UnmodifiableListView(_bookings);
  void add(Booking booking) {
    _bookings.add(booking);
    notifyListeners();
  }

  void removeAll() {
    _bookings.clear();
    notifyListeners();
  }
}

class Booking {
  final int id;
  final String destName;
  final String package;

  Booking({required this.id, required this.destName, this.package = "no"});
}
