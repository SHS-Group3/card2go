import 'package:flutter/widgets.dart';

class SearchModel extends ChangeNotifier {
  String _filter = "";

  String get filter => _filter;

  void set(String value){
    _filter = value;
    notifyListeners();
  }
}