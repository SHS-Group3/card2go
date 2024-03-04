// dashboard.dart

import 'package:card2go/booked_view.dart';
import 'package:card2go/destinations_view.dart';
import 'package:card2go/hotel_view.dart';
import 'package:card2go/login.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static const appTitle = 'CARD2GO';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(iconTheme: IconThemeData(color: Colors.white)),
      home: MyHomePage(title: "CARD2GO"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  int screen = 0;
  List screens = [
    DestinationsView(),
    HotelView(),
    BookedView(),
  ];
  void updatedItems(int value) {
    setState(() {
      screen = value;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    ListView(children: []),
    Text(
      'Sign Out',
      style: optionStyle,
    ),
    Text(
      'Support',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFDEECE),
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 120),
            child: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              backgroundColor: Color(0xff2ea308),
              flexibleSpace: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text("CARD2GO",
                            style: TextStyle(
                                color: Color(0xfffcfcfc), fontSize: 30)),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: "Search",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    size: 30,
                                  )),
                            ),
                          ),
                        )
                      ])),
            )),
        body: screens[screen],
        endDrawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text('Settings'),
              ),
              ListTile(
                title: const Text('Account'),
                selected: _selectedIndex == 0,
              ),
              ListTile(
                title: const Text('Sign Out'),
                selected: _selectedIndex == 1,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              ListTile(
                title: const Text('Support'),
                selected: _selectedIndex == 2,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(2);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            backgroundColor: Colors.green,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.pin_drop,
                  size: 50,
                ),
                label: 'Destinations',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    size: 50,
                  ),
                  label: 'Lodgings'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.map,
                    size: 50,
                  ),
                  label: 'Bookings'),
            ],
            currentIndex: screen,
            onTap: updatedItems,
            fixedColor: Colors.white,
          ),
        ));
  }
}

