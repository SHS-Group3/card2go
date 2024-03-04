import 'package:flutter/material.dart';

class HotelView extends StatelessWidget {
  HotelView({super.key});

  @override
  Widget build(BuildContext context){
    return ListView(padding: EdgeInsets.symmetric(horizontal: 15), children: [
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
    ]);
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
