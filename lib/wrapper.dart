import 'package:e_commerce_app/model/userModel.dart';
import 'package:e_commerce_app/screens/authenticate/authenticate.dart';
import 'package:e_commerce_app/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Consumer<UserModel?>(builder: (context, user, child) {
      if (user != null) {
        final userData = _auth.currentUser;
        return HomePage();
      } else {
        return Authenticate();
      }
    });
  }
}
