import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/userModel.dart';
import 'package:e_commerce_app/shared/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel? userData;

  UserModel? _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
    return UserModel(
      email: user.email,
      id: user.uid,
      name: user.displayName,
      phoneNO: user.phoneNumber,
    );
  }

  Stream<UserModel?> get onAuthStateChanged {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user!));
  }

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    notifyListeners();

    return UserModel.fromSnap(documentSnapshot);
  }

  Future<UserModel?> signUp(String email, String password, String username,
      String phoneNO, BuildContext context) async {
    try {
      // String pictureModel = 'https://i.stack.imgur.com/l60Hf.png';
      final authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = authResult.user;

      userData = UserModel(
        email: email,
        id: user!.uid,
        name: username,
        phoneNO: phoneNO,
      );

      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set(userData!.toJson());

      showToast('Registration Successful');
      notifyListeners();
      Navigator.popUntil(context, (route) => route.isFirst);

      return _userFromFirebase(user);

      // return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        //showSnackBar(context, "The password provided is too weak.");
        showToast("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        // showSnackBar(context, "An account already exists for that email.");
        showToast("An account already exists for that email.");
      } else if (e.code == 'invalid-email') {
        print('Invalid email.');
        //showSnackBar(context, "Invalid email.");
        showToast("Invalid email.");
      }
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  Future<UserModel?> signin(
      String email, String password, BuildContext context) async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = authResult.user;

      // notifyListeners();
      // Navigator.popUntil(context, (route) => route.isFirst);

      return _userFromFirebase(user!);
      // return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        // showSnackBar(context, "No user found for that email.");
        showToast("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        // showSnackBar(context, "Wrong password provided for that user.");
        showToast("Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        print('Invalid email.');
        // showSnackBar(context, "Invalid email.");
        showToast("Invalid email.");
      } else if (e.code == 'user-disabled') {
        print('This user has been disabled.');
        // showSnackBar(context, "This user has been disabled");
        showToast("This user has been disabled");
      } else if (e.code == 'too-many-requests') {
        print('Too Many requests.');
        // showSnackBar(context, "Too Many requests");
        showToast("Too Many requests");
      } else if (e.code == 'operation-not-allowed') {
        print('This operation isnt allowed.');
        //showSnackBar(context, "This operation isnt allowed");
        showToast("This operation isnt allowed");
      }
      notifyListeners();

      // since we are not actually continuing after displaying errors
      // the false value will not be returned
      // hence we don't have to check the valur returned in from the signin function
      // whenever we call it anywhere
      return Future.value(null);
    }
  }

  Future<UserModel?> currentUser() async {
    final user = await _auth.currentUser;
    return _userFromFirebase(user!);
  }

  updateUserProfile(String name, String number) async {
    try {
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'name': name,
        'phoneNO': number,
      });
      showToast("Updated Successfully");
    } catch (e) {
      print(e);
    }
  }

  resetPasswordLink(String email, BuildContext context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showToast("Password Reset Email Sent");
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print('The email address is badly formatted.');
        // showSnackBar(context, "No user found for that email.");
        showToast("The email address is badly formatted.");
      }
    } catch (e) {
      print(e);
    }
  }

  sendMessage(String message, String email, String name) {
    _firestore.collection('messages').add({
      'message': message,
      'email': email,
      'name': name,
    });
    showToast('Message Sent Successfully!!!');
  }

  Future signout() async {
    //userModel = null;

    _auth.signOut();

    //userModel = null;
    notifyListeners();
  }
}
