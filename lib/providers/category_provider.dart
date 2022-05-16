import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  late Product shirtData;

  List<Product> shirt = [];

  late Product dressData;
  List<Product> dress = [];

  late Product tieData;
  List<Product> tie = [];

  late Product shoeData;
  List<Product> shoe = [];

  late Product trouserData;
  List<Product> trouser = [];

  Future getShirtData() async {
    List<Product> newList = [];
    CollectionReference shirtCollection = FirebaseFirestore.instance
        .collection('category')
        .doc('n0DyBVxRpuVjjOov9mVk')
        .collection('shirt');

    QuerySnapshot shirtSnapshot = await shirtCollection.get();

    shirtSnapshot.docs.forEach(
      (element) {
        shirtData = Product(
            amount: element.get('amount'),
            url: element.get('url'),
            name: element.get('name'));
        newList.add(shirtData);
      },
    );
    shirt = newList;
    notifyListeners();
  }

  List<Product> get getShirtList {
    return shirt;
  }

  Future getDressData() async {
    List<Product> newList = [];
    CollectionReference dressCollection = FirebaseFirestore.instance
        .collection('category')
        .doc('n0DyBVxRpuVjjOov9mVk')
        .collection('dress');

    QuerySnapshot dressSnapshot = await dressCollection.get();

    dressSnapshot.docs.forEach(
      (element) {
        dressData = Product(
            amount: element.get('amount'),
            url: element.get('url'),
            name: element.get('name'));
        newList.add(dressData);
      },
    );
    dress = newList;
    notifyListeners();
  }

  List<Product> get getdressList {
    return dress;
  }

  Future geTieData() async {
    List<Product> newList = [];
    CollectionReference tieCollection = FirebaseFirestore.instance
        .collection('category')
        .doc('n0DyBVxRpuVjjOov9mVk')
        .collection('tie');

    QuerySnapshot tieSnapshot = await tieCollection.get();

    tieSnapshot.docs.forEach(
      (element) {
        tieData = Product(
            amount: element.get('amount'),
            url: element.get('url'),
            name: element.get('name'));
        newList.add(tieData);
      },
    );
    tie = newList;
    notifyListeners();
  }

  List<Product> get getTieList {
    return tie;
  }

  Future getShoeData() async {
    List<Product> newList = [];
    CollectionReference shoeCollection = FirebaseFirestore.instance
        .collection('category')
        .doc('n0DyBVxRpuVjjOov9mVk')
        .collection('shoe');

    QuerySnapshot shoeSnapshot = await shoeCollection.get();

    shoeSnapshot.docs.forEach(
      (element) {
        shoeData = Product(
            amount: element.get('amount'),
            url: element.get('url'),
            name: element.get('name'));
        newList.add(shoeData);
      },
    );
    shoe = newList;
    notifyListeners();
  }

  List<Product> get getShoeList {
    return shoe;
  }

  Future getTrouserData() async {
    List<Product> newList = [];
    CollectionReference trouserCollection = FirebaseFirestore.instance
        .collection('category')
        .doc('n0DyBVxRpuVjjOov9mVk')
        .collection('trouser');

    QuerySnapshot trouserSnapshot = await trouserCollection.get();

    trouserSnapshot.docs.forEach(
      (element) {
        trouserData = Product(
            amount: element.get('amount'),
            url: element.get('url'),
            name: element.get('name'));
        newList.add(trouserData);
      },
    );
    trouser = newList;
    notifyListeners();
  }

  List<Product> get getTrouserList {
    return trouser;
  }
}
