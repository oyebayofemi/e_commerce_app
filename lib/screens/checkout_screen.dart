import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:e_commerce_app/shared/widget/cartlistproduct_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Checkout Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.blue,
          child: Column(
            children: [
              cartProvider.getCartModelList.isEmpty
                  ? load()
                  : Container(
                      height: MediaQuery.of(context).size.height - 940.h,
                      // color: Colors.green,
                      child: ListView.builder(
                        itemCount: cartProvider.getCartModelListLength,
                        itemBuilder: (context, index) {
                          return CartListProductWidget(
                            amount: cartProvider.getCartModelList[index].amount,
                            name: cartProvider.getCartModelList[index].name,
                            quantity:
                                cartProvider.getCartModelList[index].quantity,
                            url: cartProvider.getCartModelList[index].url,
                            isCheckOutPage: true,
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
                    checkoutConstant('Your Price', '60.00', false, false),
                    checkoutConstant('Discount', '6', false, true),
                    checkoutConstant('Shipping', '60.00', false, false),
                    checkoutConstant('Total', '60.00', true, false),
                  ],
                ),
              ),
            ],
          ),
        ),
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

  Container cartListProduct(
    BuildContext context,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height - 2010.h,
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 2150.h,
                  width: MediaQuery.of(context).size.width - 620.w,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/men_watch.jpeg',
                        )),
                  ),
                  // child: Text('s'),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 2050.h,
                  width: MediaQuery.of(context).size.width - 620.w,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Men Trouser'),
                        Text('CLoths'),
                        Text(
                          '\$ 300.00',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Row(
                          children: [
                            Text('Quantity : '),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text('1'),
                          ],
                        )
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
