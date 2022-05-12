import 'package:e_commerce_app/screens/authenticate/login.dart';
import 'package:e_commerce_app/screens/authenticate/signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  //changing the showSignIn to false
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? SignUpPage(toggleView: toggleView)
        : LoginPage(toggleView: toggleView);
  }
}
