import 'package:e_commerce_app/services.dart/authService.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Home Page'),
          FlatButton(
              onPressed: () {
                AuthService().signout();
              },
              child: Text('Signout'))
        ],
      ),
    );
  }
}
