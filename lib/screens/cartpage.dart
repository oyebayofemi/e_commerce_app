import 'package:e_commerce_app/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  String url;
  String name;
  String amount;
  CartPage({required this.url, required this.amount, required this.name});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        elevation: 0,
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
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
      body: Container(
          // color: Colors.blue,
          child: ListView(
        children: [
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
          cartListProduct(context, widget.url, widget.name, widget.amount),
        ],
      )),
    );
  }

  Container cartListProduct(
      BuildContext context, String url, String name, String amount) {
    return Container(
      height: MediaQuery.of(context).size.height - 1910.h,
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 1950.h,
                  width: MediaQuery.of(context).size.width - 620.w,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/${url}',
                        )),
                  ),
                  // child: Text('s'),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 1950.h,
                  width: MediaQuery.of(context).size.width - 620.w,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$name'),
                        Text('CLoths'),
                        Text(
                          '\$ $amount',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 600.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonTheme(
                                minWidth:
                                    MediaQuery.of(context).size.width - 990.w,
                                child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    color: Colors.grey.shade200,
                                    onPressed: () {
                                      setState(() {
                                        quantity--;
                                        if (quantity < 0) {
                                          quantity = 0;
                                        }
                                      });
                                    },
                                    child: Text('-')),
                              ),
                              Text('$quantity'),
                              ButtonTheme(
                                minWidth:
                                    MediaQuery.of(context).size.width - 990.w,
                                child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    color: Colors.grey.shade200,
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                    child: Text('+')),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
