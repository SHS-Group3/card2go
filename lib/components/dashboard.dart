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
    ListView(padding: EdgeInsets.symmetric(horizontal: 15), children: [
      POICard(
          name: "Sampalok Lake",
          address: "Calamba, Laguma",
          image: Image.network(
              "https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcTg1GTmmBC6065Zg2BtXjwEf6zwkoOMljkE8CrecRYJRaEg5Rkmwi97a44zSDXjITiNRzZ47snDnkU9ycyCEoR4ffxd3A3vo8Myj0-a1cc")),
      POICard(
          name: "Enchanted Kingdom",
          address: "Sta.Rosa, Laguna",
          image: Image.network(
              "https://images.summitmedia-digital.com/spotph/images/2023/05/19/enchanted-kingdom-7-1684448212.jpg")),
      POICard(
          name: "neko",
          address: "Calamba City",
          image: Image.network(
              "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false")),
      POICard(
          name: "neko",
          address: "Calamba City",
          image: Image.network(
              "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false")),
      POICard(
          name: "neko",
          address: "Calamba City",
          image: Image.network(
              "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false")),
    ]),
    ListView(padding: EdgeInsets.symmetric(horizontal: 15), children: [
      HotelCard(
          name: "Casa San Pablo",
          address: "Calamba, Laguma",
          image: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK6v5o7crx-SuRYhL4JFss8cBH4GhKBgoKNA&usqp=CAU")),
      HotelCard(
          name: "Enchanted Kingdom",
          address: "Sta.Rosa, Laguna",
          image: Image.network(
              "https://images.summitmedia-digital.com/spotph/images/2023/05/19/enchanted-kingdom-7-1684448212.jpg")),
    ]),
    Text('Lodgings')
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

class POICard extends StatelessWidget {
  Image image;
  String name;
  String address;

  POICard(
      {super.key,
      required this.image,
      required this.name,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: () {},
        child: Ink(
            height: 200,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                image:
                    DecorationImage(fit: BoxFit.fitWidth, image: image.image),
                borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(name,
                      style: TextStyle(fontSize: 35, color: Colors.white))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(address,
                      style: TextStyle(fontSize: 20, color: Colors.white))),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.more_horiz_rounded,
                  size: 40,
                ),
              ))
            ])),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  Image image;
  String name;
  String address;

  HotelCard(
      {super.key,
      required this.image,
      required this.name,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 15),
        child: InkWell(
            onTap: () {},
            child: Ink(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Ink(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth, image: image.image),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(name,
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white))),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(address,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                      ])),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: [
                          Text(
                            "(5)",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Spacer(),
                          Icon(Icons.arrow_right_alt_rounded)
                        ])),
                  ),
                ],
              ),
            )));
  }
}
