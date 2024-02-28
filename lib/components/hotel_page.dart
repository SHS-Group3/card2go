import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TravelApp(),
  ));
}
class TravelApp extends StatefulWidget}{
@override
TravelState createState() => TravelState();
}

class _TravelState extends State <Travel>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
backgroundColor: Color(0xFFF6F7FF),
      elevation: 0.0,
      backgroundcolor Color(0xFFF6F7FF),
    );
  }
}