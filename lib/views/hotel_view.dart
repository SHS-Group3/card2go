import 'package:card2go/api/services.dart';
import 'package:card2go/models/search_model.dart';
import 'package:card2go/pages/destination_page.dart';
import 'package:card2go/views/destinations_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelView extends StatefulWidget {
  HotelView({super.key});

  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  List<Destination> hotel = [];

  @override
  void initState() {
    super.initState();

    loadHotels();
  }

  void loadHotels() async {
    List<Destination> hotel =
        await DestinationsService.getDestinations(hotels: true);
    setState(() {
      this.hotel = hotel;
    });
  }

  @override
  Widget build(BuildContext context) {
    SearchModel search = context.watch<SearchModel>();

    List<Destination> filtered =
        hotel.where((e) => e.name.contains(search.filter)).toList();
    return ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          return HotelCard(filtered[index]);
        });
  }
}

class HotelCard extends StatelessWidget {
  Destination hotel;
  HotelCard(this.hotel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 14, left: 6, right: 6),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DestinationPage(hotel)));
            },
            child: Ink(
              color: Color(0xff123a05),
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
