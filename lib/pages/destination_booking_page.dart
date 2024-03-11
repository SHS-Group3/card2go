import 'package:card2go/api/api.dart';
import 'package:card2go/components/button2.dart';
import 'package:card2go/models/booking_model.dart';
import 'package:card2go/pages/booked_page.dart';
import 'package:card2go/views/destinations_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DestinationBooking extends StatefulWidget {
  final POI poi;
  DestinationBooking({super.key, required this.poi});

  @override
  State<DestinationBooking> createState() => _DestinationBookingState();
}

class _DestinationBookingState extends State<DestinationBooking> {
  TextEditingController controller = TextEditingController();
  String? selected;

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
          child: Container(
            color: Colors.transparent,
            height: 100,
            padding: EdgeInsets.all(10),
            child: Consumer<BookingModel>(
              builder: (context, value, child) {
                return Button2(
                  text: "Book now!",
                  onTap: () async {
                    try {
                      int id = await Bookings.book(widget.poi.id, null);
                      Booking booking =
                          Booking(id: id, destName: widget.poi.name);
                      value.add(booking);
                      print(value.bookings);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookedPage(booking)));
                    } catch (err) {
                      print(err);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(err.toString())));
                    }
                  },
                );
              },
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Package Options',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Text(
              'Select an Option',
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: SizedBox(
                width: double.infinity,
                child: DropdownMenu<String>(
                  width: 376,
                  controller: controller,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  hintText: '',
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                    ),
                  ),
                  onSelected: (String? select) {
                    setState(() {
                      selected = select;
                    });
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry<String>(
                      value: "hi",
                      label: "hi",
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Number of Tickets',
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: SizedBox(
                width: double.infinity,
                child: DropdownMenu<String>(
                  width: 376,
                  controller: controller,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  hintText: '',
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                    ),
                  ),
                  onSelected: (String? select) {
                    setState(() {
                      selected = select;
                    });
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry<String>(
                      value: "hi",
                      label: "hi",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                height: 46,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Set Date',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 46,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Add-Ons',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 46,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Often Booked With',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 15),
                  child: Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 15),
                  child: Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 15),
                  child: Container(
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
