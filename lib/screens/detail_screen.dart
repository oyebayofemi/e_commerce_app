import 'package:e_commerce_app/shared/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatefulWidget {
  String amount;
  String url;
  String name;

  DetailPage({required this.amount, required this.name, required this.url});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
                  height: MediaQuery.of(context).size.height - 600,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'assets/${widget.url}',
                        )),
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
                width: MediaQuery.of(context).size.width - 100,
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    sizeProduct(context, 'S'),
                    sizeProduct(context, 'M'),
                    sizeProduct(context, 'L'),
                    sizeProduct(context, 'XL'),
                    sizeProduct(context, 'XXL'),
                  ],
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
                width: MediaQuery.of(context).size.width - 100,
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    colorProduct(context, Colors.red),
                    colorProduct(context, Colors.green),
                    colorProduct(context, Colors.blue),
                    colorProduct(context, Colors.pink),
                    colorProduct(context, Colors.yellow),
                  ],
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
                width: MediaQuery.of(context).size.width - 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
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
                    Text('$quantity'),
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        color: Colors.grey.shade200,
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: Text('+')),
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
                  onPressed: () async {},
                  child: Text(
                    'CHECK OUT',
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
