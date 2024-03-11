import 'package:card2go/api/api.dart';
import 'package:card2go/components/button.dart';
import 'package:card2go/components/inputfield.dart';
import 'package:card2go/dashboard.dart';
import 'package:card2go/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  String? error;

  bool _loggingIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                          "https://i.pinimg.com/736x/2d/0f/f7/2d0ff7dd7ef45a4dd03ed3a38513c79b.jpg")
                      .image)),
          padding: EdgeInsets.all(20),
          child: SafeArea(
            child: Column(children: [
              const SizedBox(height: 50),
              //logo
              Image(
                height: 150,
                image: Image.asset("assets/images/logoo.png").image,
              ),

              //welcome to Card2Go

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
              //username texfield

              InputField(
                  enabled: !_loggingIn,
                  controller: usernameController,
                  hintText: "E-Mail",
                  obsecureText: false),
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
              SizedBox(height: 10),
              //password textfield
              InputField(
                  enabled: !_loggingIn,
                  controller: passwordController,
                  hintText: "Password",
                  obsecureText: true),
              const SizedBox(height: 10),

              //forgot password?
              Button(
                enabled: !_loggingIn,
                onTap: () async {
                  try {
                    await Authentication.authenticate(
                        usernameController.text, passwordController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  } catch (err) {
                    print(err);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(err.toString())));
                  }
                },
                text: "Log In",
              ),

              const SizedBox(height: 20),
              //or continue with

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Flexible(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    child: Image.asset('assets/images/google.png', height: 40))
              ]),
              Spacer(),
              Button(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignPage()));
                  },
                  text: "Sign up"),
            ]),
          )),
    );
  }
}
