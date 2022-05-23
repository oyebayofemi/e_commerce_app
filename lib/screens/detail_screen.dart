import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/providers/notification_provider.dart';
import 'package:e_commerce_app/screens/cartpage.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:e_commerce_app/shared/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  int amount;
  String url;
  String name;

  DetailPage({required this.amount, required this.name, required this.url});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  List<bool> isSizeSelected = [true, false, false, false];
  List<bool> isColorSelected = [true, false, false, false, false];

  int mySizeIndex = 0;
  String size = 'S';

  void getSize() {
    if (mySizeIndex == 0) {
      setState(() {
        size = 'S';
      });
    } else if (mySizeIndex == 1) {
      setState(() {
        size = 'M';
      });
    } else if (mySizeIndex == 2) {
      setState(() {
        size = 'L';
      });
    } else if (mySizeIndex == 3) {
      setState(() {
        size = 'XL';
      });
    }
  }

  int myColorIndex = 0;
  String color = 'Red';

  void getColor() {
    if (myColorIndex == 0) {
      setState(() {
        color = 'Red';
      });
    } else if (myColorIndex == 1) {
      setState(() {
        color = 'Green';
      });
    } else if (myColorIndex == 2) {
      setState(() {
        color = 'Blue';
      });
    } else if (myColorIndex == 3) {
      setState(() {
        color = 'Pink';
      });
    } else if (myColorIndex == 4) {
      setState(() {
        color = 'Yellow';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    NotificationProvider notificationProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Detail Page'),
        actions: [
          NotificationButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  // color: Colors.blue,
                  height: 700.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain, image: NetworkImage(widget.url)),
                  )),
              SizedBox(
                height: 70.h,
              ),
              Text(
                widget.name,
                style: featuredText(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '\$ ${widget.amount}',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Description',
                style: featuredText(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Wrap(
                  children: [
                    Text(
                        'After seeing the positive and informative reviews, I decided to purchase the product. This item meets my expectation. Solid and beautiful shoe. Note: I visited the official Adidas website to compare the shoe sizes. Afterwards, I measured my shoe size in cm before placing an order. I usually wear a size of 11.5 inch in UK which equivalent is 46 2/3. EU. I ordered a 46 2/3 and it fits perfectly.'),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Size',
                style: featuredText(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 190.w,
                // color: Colors.blue,
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     sizeProduct(context, 'S'),
                //     sizeProduct(context, 'M'),
                //     sizeProduct(context, 'L'),
                //     sizeProduct(context, 'XL'),
                //     sizeProduct(context, 'XXL'),
                //   ],
                // ),
                child: ToggleButtons(
                  children: [
                    sizeProduct(context, 'S'),
                    sizeProduct(context, 'M'),
                    sizeProduct(context, 'L'),
                    sizeProduct(context, 'XL'),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int indexButtn = 0;
                          indexButtn < isSizeSelected.length;
                          indexButtn++) {
                        if (indexButtn == index) {
                          isSizeSelected[indexButtn] = true;
                        } else {
                          isSizeSelected[indexButtn] = false;
                        }
                      }
                    });
                    setState(() {
                      mySizeIndex = index;
                      // print(mySizeIndex);
                    });
                  },
                  isSelected: isSizeSelected,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Color',
                style: featuredText(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 220.w,
                // color: Colors.blue,
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     colorProduct(context, Colors.red),
                //     colorProduct(context, Colors.green),
                //     colorProduct(context, Colors.blue),
                //     colorProduct(context, Colors.pink),
                //     colorProduct(context, Colors.yellow),
                //   ],
                // ),
                child: ToggleButtons(
                  renderBorder: false,
                  fillColor: Colors.orange[300],
                  children: [
                    colorProduct(context, Colors.red),
                    colorProduct(context, Colors.green),
                    colorProduct(context, Colors.blue),
                    colorProduct(context, Colors.pink),
                    colorProduct(context, Colors.yellow),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int indexButtn = 0;
                          indexButtn < isColorSelected.length;
                          indexButtn++) {
                        if (indexButtn == index) {
                          isColorSelected[indexButtn] = true;
                        } else {
                          isColorSelected[indexButtn] = false;
                        }
                      }
                    });
                    setState(() {
                      myColorIndex = index;
                      // print(myColorIndex);
                    });
                  },
                  isSelected: isColorSelected,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Quantity',
                style: featuredText(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 220.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        color: Colors.orange,
                        onPressed: () {
                          setState(() {
                            quantity--;
                            if (quantity < 1) {
                              quantity = 1;
                            }
                          });
                        },
                        child: Text(
                          '-',
                          style: TextStyle(color: Colors.white),
                        )),
                    Text('$quantity'),
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        color: Colors.orange,
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: Text(
                          '+',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              ButtonTheme(
                buttonColor: Colors.white,
                minWidth: MediaQuery.of(context).size.width,
                height: 150.h,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(Radius.circular(70.r))),
                child: FlatButton(
                  color: Colors.orange,
                  onPressed: () async {
                    getSize();
                    getColor();

                    cartProvider.getCartData(widget.name, widget.url, quantity,
                        widget.amount, color, size);
                    notificationProvider.addNotification('notification');

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ));
                  },
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
