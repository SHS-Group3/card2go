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
  int screen = 0;
  List screens = [
    ListView(children: [
      POIEntry(
          image: Image.network(
              "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false")),
      POIEntry(
          image: Image.network(
              "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false")),
      POIEntry(
          image: Image.network(
              "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false")),
      POIEntry(
          image: Image.network(
              "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false")),
      POIEntry(
          image: Image.network(
              "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false")),
    ]),
    Text('Lodgings'),
    Text('Bookings')
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
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: AppBar(
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
                                  borderSide: BorderSide(color: Colors.white)),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30,
                              ),
                            ),
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
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}

class POIEntry extends StatelessWidget {
  Image image;

  POIEntry({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Text("hi"),
          Text("aaaa"),
          ElevatedButton(onPressed: () {}, child: Text("yoo mama"))
        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fitWidth, image: image.image)),
    );
  }
}
