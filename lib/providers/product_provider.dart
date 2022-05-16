import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  late Product featureData;
  List<Product> feature = [];

  late Product achieveData;
  List<Product> achieve = [];

  Future getfeatureData() async {
    List<Product> newList = [];
    CollectionReference featuredProductCollection = FirebaseFirestore.instance
        .collection('products')
        .doc('hLWQUcBxUXPezSJEctw6')
        .collection('featuredProducts');

    QuerySnapshot featureSnapshot = await featuredProductCollection.get();

    featureSnapshot.docs.forEach(
      (element) {
        featureData = Product(
            amount: element.get('amount'),
            url: element.get('url'),
            name: element.get('name'));
        newList.add(featureData);
      },
    );
    feature = newList;
    notifyListeners();
  }

  List<Product> get getFeatureList {
    return feature;
  }

  Future getAchieveData() async {
    List<Product> newList = [];
    CollectionReference achieveProductCollection = FirebaseFirestore.instance
        .collection('products')
        .doc('hLWQUcBxUXPezSJEctw6')
        .collection('achivesProduct');

    QuerySnapshot achieveSnapshot = await achieveProductCollection.get();

    achieveSnapshot.docs.forEach(
      (element) {
        achieveData = Product(
            amount: element.get('amount'),
            url: element.get('url'),
            name: element.get('name'));
        newList.add(achieveData);
      },
    );
    achieve = newList;
    notifyListeners();
  }

  List<Product> get getAchieveList {
    return achieve;
  }
}
