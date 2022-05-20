import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? currentData;

  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (value.exists) {
      userModel = UserModel(
        email: value.get('email'),
        phoneNO: value.get('phoneNO'),
        name: value.get('name'),
        id: value.get('id'),
        url: value.get('url'),
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel? get currentUserData {
    return currentData;
  }
}
