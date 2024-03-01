import 'package:card2go/components/my_button.dart';
import 'package:card2go/components/signtextfield.dart';
import 'package:card2go/components/square_tile.dart';
import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  SignPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final SU_Username = TextEditingController();
  final SU_email = TextEditingController();
  final SU_Contact = TextEditingController();
  final SU_Password = TextEditingController();
  var _agreed = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 120),
          child: SafeArea(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.close,
                      size: 30,
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 27),
                            )))
                  ],
                ),
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffffecb3)),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                          "https://i.pinimg.com/736x/2d/0f/f7/2d0ff7dd7ef45a4dd03ed3a38513c79b.jpg")
                      .image)),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Username',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SU(
                    controller: SU_Username,
                    hintText: "Username",
                    obsecureText: true),
                const SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SU(controller: SU_email, hintText: "Email", obsecureText: true),
                const SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Contact Number',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SU(
                    controller: SU_Contact,
                    hintText: "Contact Number",
                    obsecureText: true),
                const SizedBox(height: 4),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SU(
                    controller: SU_Password,
                    hintText: "Password",
                    obsecureText: true),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: <Widget>[
                      new Checkbox(
                          value: _agreed,
                          activeColor: Colors.green,
                          onChanged: (newValue) {
                            setState(() {
                              _agreed = newValue!;
                            });
                          }),
                      Text("i agree with the terms and condition"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                MyButton(onTap: () {}, text: "Sign Up"),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Or continue with',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SquareTile(
                    imagePath: 'assets/images/google.png',
                  )
                ]),
              ],
            ),
          ),
        ),
      );
}
