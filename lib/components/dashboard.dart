// dashboard.dart

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        appBar: AppBar(
          backgroundColor: Colors.green,
          toolbarHeight: 120,
          title: Container(
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
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
                child: Center(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    child: Center(
                      child: Text('$index',
                          textScaler: const TextScaler.linear(0)),
                    ),
                  );
                },
                childCount: 9,
              ),
            ),
          ],
        ),
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
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(0);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Sign Out'),
                selected: _selectedIndex == 1,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(1);
                  // Then close the drawer
                  Navigator.pop(context);
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
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Column(
                  children: [
                    Icon(
                      Icons.pin_drop,
                      size: 60,
                      color: Colors.white,
                    ),
                    Text(
                      "Destinations",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Column(
                  children: [
                    Icon(
                      Icons.home,
                      size: 60,
                      color: Colors.white,
                    ),
                    Text(
                      "Lodgings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Column(
                  children: [
                    Icon(
                      Icons.map_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                    Text(
                      "Bookings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingPage()),
                );
              },
              child: Text('Go to Booking Page'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green, // Background color of the button
                backgroundColor: Colors.white, // Text color of the button
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CARD2GO',
          style: TextStyle(color: Colors.yellow[600]),
        ),
        backgroundColor: Colors.green[900],
      ),
      body: Center(
        child: Text(
          'Welcome to Card2Go Booking Application!',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
