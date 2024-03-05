import 'package:flutter/material.dart';

import '../hotel_view.dart';

class HotelPage extends StatelessWidget {
  Hotel hotel;
  HotelPage(this.hotel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDEECE),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(" "),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14), color: Colors.green),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 228,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                            tag: hotel.name,
                            child: Image(
                              image: Image.network(hotel.imageUrl).image,
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Spacer(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                hotel.name,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                hotel.address,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    child: Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
