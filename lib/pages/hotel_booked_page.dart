import 'package:flutter/material.dart';

import '../components/button2.dart';

class HotelBookedPage extends StatelessWidget {
  HotelBookedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDEECE),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: AppBar(
          backgroundColor: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
          ),
          flexibleSpace: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  "Booking",
                  style: TextStyle(color: Color(0xfffcfcfc), fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.zero,
        child: SafeArea(
          child: SizedBox(
            height: 200,
            child: Column(
              children: [
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(5),
                  child: Button2(
                    text: "Cancel Booking",
                    onTap: () {},
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(5),
                  child: Button2(
                      text: "Done!",
                      onTap: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 310,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Container(
              child: (Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Destination name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26)),
                      Text('No. of Person:', style: TextStyle(fontSize: 18)),
                      Text('Tracking No:', style: TextStyle(fontSize: 18)),
                      Text('Date Booked:', style: TextStyle(fontSize: 18)),
                      Text('Add-Ons:', style: TextStyle(fontSize: 18)),
                      Divider(),
                      Text('Official Reciept'),
                      receiptListing("Lodging Fee", 69),
                      receiptListing("Add-Ons", 20),
                      receiptListing("Admission Fee", 20),
                      receiptListing("Total", 20),
                    ],
                  ),
                )
              ],
            ),
          ))),
        ),
      ),
    );
  }

  Widget receiptListing(String name, double value) {
    return Row(children: [
      Expanded(
        child: Align(alignment: Alignment.centerLeft, child: Text(name)),
      ),
      Expanded(
        child: Align(
            alignment: Alignment.centerRight, child: Text(value.toString())),
      ),
    ]);
  }
}
