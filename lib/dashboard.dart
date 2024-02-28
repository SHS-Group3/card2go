import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Card2Go Home',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add navigation logic or other actions for the button
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

void signUserIn(BuildContext context) {
  // Add your sign-in logic here
  // If sign-in is successful, navigate to the home page
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
}
//sign in button
