import 'package:card2go/api/api.dart';
import 'package:flutter/material.dart';

import '../pages/destination_page.dart';

class DestinationsView extends StatefulWidget {
  DestinationsView({super.key});

  @override
  State<DestinationsView> createState() => _DestinationsViewState();
}

class _DestinationsViewState extends State<DestinationsView> {
  List<POI> pois = [];

  @override
  void initState() {
    super.initState();

    loadPOIs();
  }

  void loadPOIs() async {
    List<POI> pois = await POIs.getPOIs();

    setState(() {
      this.pois = pois;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: pois.length,
        itemBuilder: (context, index) {
          return POICard(pois[index]);
        });
  }
}

class POICard extends StatelessWidget {
  POI poi;

  POICard(this.poi, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
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

class POI {
  final int id;
  final String name;
  final String address;
  final String description;
  final String imageUrl;

  POI(
      {required this.id,
      required this.name,
      required this.address,
      this.description = "among us",
      this.imageUrl =
          "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false"});
}
