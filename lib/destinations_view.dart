import 'package:flutter/material.dart';

import 'destination_page.dart';

class DestinationsView extends StatelessWidget {
  DestinationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.symmetric(horizontal: 15), children: [
      POICard(POI(
          name: "Sampalok Lake",
          address: "Calamba, Laguma",
          imageUrl:
              "https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcTg1GTmmBC6065Zg2BtXjwEf6zwkoOMljkE8CrecRYJRaEg5Rkmwi97a44zSDXjITiNRzZ47snDnkU9ycyCEoR4ffxd3A3vo8Myj0-a1cc")),
      POICard(POI(
          name: "Enchanted Kingdom",
          address: "Sta.Rosa, Laguna",
          imageUrl:
              "https://images.summitmedia-digital.com/spotph/images/2023/05/19/enchanted-kingdom-7-1684448212.jpg")),
      POICard(POI(name: "neko2", address: "neko")),
      POICard(POI(name: "neko1", address: "neko")),
      POICard(POI(name: "neko", address: "neko"))
    ]);
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
  final String name;
  final String address;
  final String description;
  final String imageUrl;

  POI(
      {required this.name,
      required this.address,
      this.description = "among us",
      this.imageUrl =
          "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false"});
}
