import 'package:card2go/components/button2.dart';
import 'package:card2go/pages/destination_booking_page.dart';
import 'package:card2go/views/destinations_view.dart';
import 'package:flutter/material.dart';

class DestinationPage extends StatelessWidget {
  Destination poi;

  DestinationPage(this.poi);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3DFA6),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text(" "),
      //   flexibleSpace: PreferredSize(
      //       preferredSize: Size.zero,
      //       child: DecoratedBox(
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(14),
      //           color: Color(0xff123a05),
      //         ),
      //         child: Column(
      //           children: [
      //             SizedBox(
      //               height: 0,
      //               child: Stack(
      //                 children: [
      //                   Positioned.fill(
      //                     child: Hero(
      //                       tag: poi.name,
      //                       child: Image.network(
      //                         poi.imageUrl,
      //                         fit: BoxFit.fitWidth,
      //                       ),
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.all(20),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.end,
      //                       children: [
      //                         Align(
      //                           alignment: Alignment.centerLeft,
      //                           child: Text(
      //                             poi.name,
      //                             style: TextStyle(
      //                               fontSize: 30,
      //                               color: Colors.white,
      //                             ),
      //                           ),
      //                         ),
      //                         Align(
      //                           alignment: Alignment.centerLeft,
      //                           child: Text(
      //                             poi.address,
      //                             style: TextStyle(
      //                               fontSize: 20,
      //                               color: Colors.white,
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Align(
      //                 child: Text(
      //                   "Description",
      //                   style: TextStyle(
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //                 alignment: Alignment.centerLeft,
      //               ),
      //             ),
      //           ],
      //         ),
      //       )),
      //   iconTheme: IconThemeData(color: Colors.white),
      // ),
      // bottomNavigationBar: PreferredSize(
      //     preferredSize: Size.zero,
      //     child: SafeArea(
      //       child: Container(
      //         color: Colors.transparent,
      //         height: 130,
      //         padding: EdgeInsets.all(20),
      //         child: Button2(
      //           text: "Book now!",
      //           onTap: () {
      //
      //           },
      //         ),
      //       ),
      //     )),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.all(20),
              centerTitle: false,
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      poi.name,
                    ),
                    Text(
                      style: TextStyle(fontSize: 16),
                      poi.address,
                    ),
                  ]),
              background: Hero(
                  tag: poi.name,
                  child: Material(
                      child: Ink.image(
                          fit: BoxFit.cover,
                          image: Image.network(poi.imageUrl).image)))),
        ),
        SliverPadding(
            padding: EdgeInsets.all(0),
            sliver: SliverList.list(children: [
              Container(
                color: Color(0xff123a05),
                child: Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                padding: EdgeInsets.all(10),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  poi.description,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              if (poi.isLodging) ...<Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    "Beds ${poi.beds}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    "Rooms ${poi.rooms}",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
              if (poi.packages.isNotEmpty) ...<Widget>[
                Divider(),
                Text("  Packages",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ...poi.packages.map((e) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Text("${e.title}\n"
                        "${e.description}"),
                  );
                })
              ]
            ]))
      ]),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: Padding(
      //         padding: const EdgeInsets.all(10),
      //         child: ListView(
      //           children: [
      //             Text(poi.description),
      //             if (poi.packages.isNotEmpty) ...<Widget>[
      //               Divider(),
      //               Text("Packages"),
      //               ...poi.packages.map((e) => Text("${e.title}\n"
      //                   "${e.description}"))
      //             ],
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 130,
        padding: EdgeInsets.all(20),
        child: Button2(
          text: "Book now!",
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DestinationBooking(
                      poi: poi,
                    )));
          },
        ),
      ),
    );
  }
}
