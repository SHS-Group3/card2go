import 'package:card2go/components/my_button.dart';
import 'package:card2go/components/my_textfield.dart';
import 'package:card2go/components/square_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),

              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),

              //welcome to Card2Go
              Text(
                'Welcome to Card2Go',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 25),

              //username texfield
              MyTextField(
                  controller: usernameController,
                  hintText: "E-Mail",
                  obsecureText: false),

              SizedBox(height: 10),
              //password textfield
              MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obsecureText: true),
              const SizedBox(height: 10),
              //forgot passsword?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              //sign in button
              MyButton(onTap: signUserIn),
              const SizedBox(height: 50),
              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SquareTile(
                  imagePath: 'assets/images/google.png',
                )
              ]),

              const SizedBox(width: 10)
            ],
          ),
        ),
      ),
    );
  }
}
