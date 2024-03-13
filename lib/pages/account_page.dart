import 'package:card2go/api/services.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  User? _user;
  @override
  void initState() {
    super.initState();

    loadUser();
  }

  void loadUser() async {
    User u = await UserService.getUser();

    setState(() {
      _user = u;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff123a05),
        title: Text(
          "Account",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: _user != null
          ? ListView(padding: EdgeInsets.all(20), children: [
              Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.black,
                    size: 50,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    _user!.username,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(),
              Container(
                height: 40,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Color(0xff123a05), border: null),
                child: Center(
                    child: Text(
                  "Account Number",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              Text(_user!.contactNumber),
              Container(
                height: 40,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Color(0xff123a05), border: null),
                child: Center(
                    child: Text(
                  "Account Email",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              Text(_user!.email)
            ])
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class User {
  final String username;
  final String contactNumber;
  final String email;

  User(
      {required this.username,
      required this.contactNumber,
      required this.email});
}
