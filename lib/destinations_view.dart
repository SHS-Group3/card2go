import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DestinationsView extends StatelessWidget {
  DestinationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.symmetric(horizontal: 15), children: [
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
          name: "neko1",
          address: "Calamba City",
          image: Image.network(
              "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false")),
      POICard(
          name: "neko2",
          address: "Calamba City",
          image: Image.network(
              "https://cataas.com/cat?type=square&fit=fill&position=centre&html=false&json=false")),
    ]);
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
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.only(top: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Ink(
          height: 200,
          child: InkWell(
            onTap: () {

            },
            child: Stack(children: [
              Hero(
                  tag: name,
                  child:
                      Ink.image(fit: BoxFit.fitWidth, image: image.image)),
              Padding(
                padding: EdgeInsets.all(15),
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
                ]),
              )
            ]),
          )),
    );
  }
}

class POI {

}
