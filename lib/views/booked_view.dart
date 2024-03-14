import 'package:card2go/models/booking_model.dart';
import 'package:card2go/pages/booked_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookedView extends StatefulWidget {
  @override
  State<BookedView> createState() => _BookedViewState();
}

class _BookedViewState extends State<BookedView> {
  @override
  Widget build(BuildContext context) {
    var model = context.watch<BookingModel>();
    return Scaffold(
      backgroundColor: Color(0xFFE3DFA6),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: model.bookings.length,
            itemBuilder: (context, index) {
              return bookingButton(context, model.bookings[index]);
            }),
      ),
    );
  }

  Widget bookingButton(BuildContext context, Booking booking) {
    return Padding(
      padding: const EdgeInsets.all(1.4),
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Color(0xFFFFFFFF)),
        height: 50,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BookedPage(booking)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    booking.destination.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: (Text("Date "
                      "${DateFormat("dd-MM-yyyy").format(booking.on)}")),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      color: Colors.black,
                      Icons.arrow_right,
                      size: 36,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
