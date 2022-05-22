import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/services.dart/authService.dart';
import 'package:e_commerce_app/shared/toast.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:e_commerce_app/shared/widget/cartlistproduct_widget.dart';
import 'package:e_commerce_app/shared/widget/notification_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    double subtotal = 0;
    double discount = 30;
    double total;
    double discountRupees;
    double shipping = 60;
    CartProvider cartProvider = Provider.of(context);

    cartProvider.cartModelList.forEach((e) {
      subtotal += e.amount + e.quantity;
    });

    discountRupees = discount / 100 * subtotal;
    total = subtotal + shipping - discountRupees;

    if (cartProvider.getCartModelList.isEmpty) {
      total = 0.0;
      shipping = 0.0;
      discount = 0.0;
    }
    late int indexs;

    UserProvider userProvider = Provider.of(context);

    userProvider.getUserData();

    var userData = userProvider.currentUserData;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Checkout Page'),
        centerTitle: true,
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          // IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
          NotificationButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: userData == null
            ? load()
            : Container(
                // color: Colors.blue,
                child: Column(
                  children: [
                    cartProvider.getCartModelList.isEmpty
                        ? Container(
                            height: MediaQuery.of(context).size.height - 960.h,
                            child: Center(
                              child: Text('No Item'),
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height - 940.h,
                            // color: Colors.green,
                            child: ListView.builder(
                              itemCount: cartProvider.getCartModelListLength,
                              itemBuilder: (context, index) {
                                indexs = index;
                                return CartListProductWidget(
                                  amount: cartProvider
                                      .getCartModelList[index].amount,
                                  name:
                                      cartProvider.getCartModelList[index].name,
                                  quantity: cartProvider
                                      .getCartModelList[index].quantity,
                                  url: cartProvider.getCartModelList[index].url,
                                  isCheckOutPage: true,
                                  index: index,
                                );
                              },
                            ),
                          ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      // color: Colors.red,
                      height: MediaQuery.of(context).size.height - 1900.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          checkoutConstant(
                              'Subtotal', '$subtotal', false, false),
                          checkoutConstant(
                              'Discount', '$discount', false, true),
                          checkoutConstant(
                              'Shipping', '$shipping', false, false),
                          checkoutConstant('Total', '$total', true, false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => CheckoutPage(),
          //     ));
          if (cartProvider.getCartModelList.isNotEmpty) {
            if (indexs != null && userData != null) {
              _firestore
                  .collection('orders')
                  .doc(_auth.currentUser!.uid)
                  .collection('order')
                  .add({
                'product': cartProvider.getCartModelList
                    .map((d) => {
                          'productName': d.name,
                          'productAmount': d.amount,
                          'productQuantity': d.quantity,
                        })
                    .toList(),
                'total': total,
                'name': userData.name!,
                'email': userData.email!,
                'phone': userData.phoneNO!,
                'uid': userData.id!,
              });

              cartProvider.clearCheckoutList();
            }
          } else {
            print('No item');
            showToast('No item');
          }
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            height: MediaQuery.of(context).size.height - 2180.h,
            color: Colors.orange,
            child: Center(
              child: Text(
                'BUY',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ),
    );
  }

  Padding checkoutConstant(
      String title, String sub, bool isTotal, bool isPercent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title',
            style: isTotal ? checkoutTotalText() : checkoutTitleText(),
          ),
          Text(
            isPercent ? '$sub%' : '\$ $sub',
            style: isTotal ? checkoutTotalText() : checkoutTitleText(),
          ),
        ],
      ),
    );
  }
}
