import 'package:card2go/pages/hotel_page.dart';
import 'package:flutter/material.dart';

class HotelView extends StatelessWidget {
  HotelView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.symmetric(horizontal: 15), children: [
      HotelCard(
        Hotel(
            name: "Casa San Pablo",
            address: "Calamba, Laguma",
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK6v5o7crx-SuRYhL4JFss8cBH4GhKBgoKNA&usqp=CAU"),
      ),
      HotelCard(
        Hotel(
            name: "Enchanted Kingdom",
            address: "Sta.Rosa, Laguna",
            imageUrl:
                "https://images.summitmedia-digital.com/spotph/images/2023/05/19/enchanted-kingdom-7-1684448212.jpg"),
      ),
      HotelCard(Hotel(
        name: "cat",
        address: "cat",
      ))
    ]);
  }
}

class HotelCard extends StatelessWidget {
  Hotel hotel;
  HotelCard(this.hotel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 15),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HotelPage(hotel)));
            },
            child: Ink(
              color: Colors.green,
              child: Column(
                children: [
                  Ink(
                      child: Stack(children: [
                    Positioned.fill(
                        child: Hero(
                            tag: hotel.name,
                            child: Material(
                              child: Ink.image(
                                  fit: BoxFit.fitWidth,
                                  image: Image.network(hotel.imageUrl).image),
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(hotel.name,
                                style: TextStyle(
                                    fontSize: 35, color: Colors.white))),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(hotel.address,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))),
                      ]),
                    ),
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
                          Text("(170)",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white)),
                          Spacer(),
                          Text("View",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white)),
                          Icon(Icons.arrow_right_alt_rounded)
                        ])),
                  ),
                ],
              ),
            )));
  }
}

class Hotel {
  final String imageUrl;
  final String name;
  final String address;

  Hotel(
      {this.imageUrl =
          "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false",
      required this.name,
      required this.address});
}
