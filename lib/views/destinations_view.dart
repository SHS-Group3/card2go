import 'package:card2go/api/services.dart';
import 'package:card2go/models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/destination_page.dart';

class DestinationsView extends StatefulWidget {
  DestinationsView({super.key});

  @override
  State<DestinationsView> createState() => _DestinationsViewState();
}

class _DestinationsViewState extends State<DestinationsView> {
  List<Destination> pois = [];

  @override
  void initState() {
    super.initState();

    loadPOIs();
  }

  void loadPOIs() async {
    List<Destination> pois =
        await DestinationsService.getDestinations(hotels: false);

    setState(() {
      this.pois = pois;
    });
  }

  @override
  Widget build(BuildContext context) {
    SearchModel search = context.watch<SearchModel>();

    List<Destination> filtered =
        pois.where((e) => e.name.contains(search.filter)).toList();
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          return POICard(filtered[index]);
        });
  }
}

class POICard extends StatelessWidget {
  Destination poi;

  POICard(this.poi, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(top: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Ink(
          height: 200,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DestinationPage(poi)));
            },
            child: Stack(children: [
              Hero(
                  tag: poi.name,
                  child: Material(
                    child: Ink.image(
                        fit: BoxFit.fitWidth,
                        image: Image.network(poi.imageUrl).image),
                  )),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(poi.name,
                          style: TextStyle(fontSize: 35, color: Colors.white))),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(poi.address,
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.more_horiz_rounded,
                      size: 40,
                    ),
                  ))
                ]),
              )
            ]),
          )),
    );
  }
}

class Destination {
  final int id;
  final String name;
  final String address;
  final String description;
  final String imageUrl;
  final bool isLodging;
  final double ratings;
  final int beds;
  final int rooms;
  final List<Package> packages;

  Destination(
      {required this.id,
      required this.name,
      required this.address,
      this.description = "among us",
      this.imageUrl =
          "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false",
      this.packages = const [],
      required this.isLodging,
      required this.ratings,
      required this.beds,
      required this.rooms});
}

class Package {
  final int id;
  final String title;
  final String description;
  final double price;

  Package(
      {required this.id,
      required this.title,
      required this.description,
      required this.price});
}
