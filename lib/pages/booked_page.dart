import 'package:card2go/api/services.dart';
import 'package:card2go/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/button2.dart';

class BookedPage extends StatelessWidget {
  Booking booking;
  BookedPage(this.booking, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3DFA6),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 54),
        child: AppBar(
          backgroundColor: Color(0xff123a05),
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
                    onTap: () async {
                      try {
                        await BookingService.cancel(booking);
                        Provider.of<BookingModel>(context, listen: false)
                            .remove(booking);
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      } catch (err) {
                        print(err);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(err.toString())));
                      }
                    },
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
          height: 400,
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
                  child: Builder(builder: (context) {
                    double tickets = booking.package != null
                        ? booking.tickets.toDouble() *
                            booking.package!.price!.round()
                        : 0;
                    double admission = 30;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(booking.destination.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26)),
                        booking.package != null
                            ? Text('Package: ' '${booking.package!.title}',
                                style: TextStyle(fontSize: 18))
                            : SizedBox.shrink(),
                        Text('No. of Tickets: ' '${booking.tickets}',
                            style: TextStyle(fontSize: 18)),
                        Text('Tracking No: ' '${booking.id}',
                            style: TextStyle(fontSize: 18)),
                        Text(
                            'Date Booked: '
                            '${DateFormat("dd-MM-yyyy").format(booking.created)}',
                            style: TextStyle(fontSize: 18)),
                        Text(
                            'Booked for the date: '
                            '${DateFormat("dd-MM-yyyy").format(booking.on)}',
                            style: TextStyle(fontSize: 18)),
                        Text('Add-Ons:', style: TextStyle(fontSize: 18)),
                        Divider(),
                        Text('Official Reciept'),
                        receiptListing("Tickets x${booking.tickets}", tickets),
                        receiptListing("Add-Ons", 0),
                        receiptListing("Admission Fee", 30),
                        receiptListing("Total", tickets + admission),
                      ],
                    );
                  }),
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
