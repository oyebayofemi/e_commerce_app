import 'package:e_commerce_app/model/cart_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartModelList = [];
  late CartModel cartModelData;

  void getCartData(String name, String url, int quantity, int amount) {
    cartModelData =
        CartModel(name: name, url: url, amount: amount, quantity: quantity);

    cartModelList.add(cartModelData);
    notifyListeners();
  }

  List<CartModel> get getCartModelList {
    return List.from(cartModelList);
  }

  int get getCartModelListLength {
    return cartModelList.length;
  }
}
