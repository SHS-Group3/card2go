import 'package:card2go/components/button2.dart';
import 'package:flutter/material.dart';

import '../views/hotel_view.dart';
import 'hotel_booking_page.dart';

class HotelPage extends StatelessWidget {
  Hotel hotel;
  HotelPage(this.hotel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDEECE),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(" "),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: PreferredSize(
          preferredSize: Size.zero,
          child: SafeArea(
            child: Container(
              color: Colors.transparent,
              height: 130,
              padding: EdgeInsets.all(20),
              child: Button2(
                text: "Book now!",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HotelBooking()));
                },
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.green,
              ),
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
                            child: Image.network(
                              hotel.imageUrl,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
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
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  hotel.address,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                          color: Colors.white,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "among ushaouhrouahraraiwjahwrhawjrawwauhrawraw",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                          "among ushaouhrouahrar\naiwjahwrhawjraw\nwauhrawraw\n"),
                      Text(
                          "among ushaouhrouahrar\naiwjahwrhawjraw\nwauhrawraw\n"),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text(
                          "among ushaouhrouahrar\naiwjahwrhawjraw\nwauhrawraw\n"),
                      Text(
                          "among ushaouhrouahrar\naiwjahwrhawjraw\nwauhrawraw\n"),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          "among ushaouhrouahrar\naiwjahwrhawjraw\nwauhrawraw\n"),
                      Text(
                          "among ushaouhrouahrar\naiwjahwrhawjraw\nwauhrawraw\n"),
                      Text(
                          "among ushaouhrouahrar\naiwjahwrhawjraw\nwauhrawraw\n"),
                      Text(
                          "among ushaouhrouahrar\naiwjahwrhawjraw\nwauhrawraw\n"),
                      Text(
                          "among ushaouhrouahrar\naiwjahwrhawjraw\nwauhrawraw\n"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
