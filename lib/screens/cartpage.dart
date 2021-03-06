import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/notification_provider.dart';
import 'package:e_commerce_app/screens/checkout_screen.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:e_commerce_app/shared/widget/cartlistproduct_widget.dart';
import 'package:e_commerce_app/shared/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // int quantity = 0;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    NotificationProvider notificationProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
        centerTitle: true,
        elevation: 0,
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          // IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
          NotificationButton(),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // notificationProvider.addNotification('notification');
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutPage(),
              ));
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            height: MediaQuery.of(context).size.height - 2150.h,
            color: Colors.orange,
            child: Center(
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ),
      body: cartProvider.getCartModelList.isEmpty
          ? load()
          : Container(
              // color: Colors.blue,
              child: ListView.builder(
              itemCount: cartProvider.getCartModelListLength,
              itemBuilder: (context, index) {
                return CartListProductWidget(
                  index: index,
                  amount: cartProvider.getCartModelList[index].amount,
                  name: cartProvider.getCartModelList[index].name,
                  quantity: cartProvider.getCartModelList[index].quantity,
                  url: cartProvider.getCartModelList[index].url,
                  color: cartProvider.getCartModelList[index].color,
                  size: cartProvider.getCartModelList[index].size,
                  isCheckOutPage: false,
                );
              },
            )),
    );
  }
}
