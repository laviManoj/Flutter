import 'package:flutter/material.dart';

class LoginSignup extends StatefulWidget {
const LoginSignup({Key? key}) : super(key: key);
  @override
  State<LoginSignup> createState() => _LoginSignupState();
}
class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Text(
                "Hello There!",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            // Rest of the code remains the same
          ],
        ),
      ),
    );
  }
}
