import 'package:e_commerce_app/screens/detail_screen.dart';
import 'package:e_commerce_app/screens/list_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration textFormFieldDecoration() {
  return InputDecoration(
    errorBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
    filled: true,
    fillColor: Colors.transparent,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.orange)),
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
    //focusColor: Colors.orange[100],
  );
}

TextStyle authText() {
  return TextStyle(
    fontSize: 100.sp,
    fontWeight: FontWeight.bold,
  );
}

Widget load() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

TextStyle featuredText() {
  return TextStyle(
    fontSize: 45.sp,
    fontWeight: FontWeight.bold,
  );
}

Widget featuredProduct(
    {required int amount,
    required String name,
    required String url,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailPage(amount: amount, name: name, url: url),
          ));
    },
    child: Card(
      child: Container(
        height: MediaQuery.of(context).size.height - 1670.h,
        // height: 100,
        width: MediaQuery.of(context).size.width - 600.w,
        // width: 200,
        // color: Colors.red,
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height - 1831.h,
                width: double.maxFinite,
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                // color: Colors.blueGrey,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(url)),
                )),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                Text(
                  '\$ $amount',
                  style: TextStyle(color: Colors.grey[500]),
                ),
                Wrap(
                  children: [
                    Text(
                      '$name',
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget listProduct(
    {required int amount,
    required String name,
    required String url,
    required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailPage(amount: amount, name: name, url: url),
          ));
    },
    child: Card(
      child: Container(
        height: MediaQuery.of(context).size.height - 700.h,
        // height: 100,
        width: MediaQuery.of(context).size.width - 620.w,
        // width: 200,
        // color: Colors.red,
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height - 1980.h,
                width: double.maxFinite,
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                // color: Colors.blueGrey,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(url)),
                )),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Text(
                    '\$ $amount',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  Wrap(
                    children: [
                      Text(
                        '$name',
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget homeCircleAvatar(
    Color color, String url, String name, var snapshot, BuildContext context) {
  // var name;
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListProduct(name: name, snapshot: snapshot),
          ));
    },
    child: CircleAvatar(
      backgroundColor: color,
      radius: 100.r,
      child: Container(
        height: 130.h,
        child: Image(
          // color: Colors.red,
          image: NetworkImage(url),
        ),
      ),
    ),
  );
}

Widget carouselBuild(AssetImage urlImage, int index) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.contain, image: urlImage),
      ));
}

Container sizeProduct(BuildContext context, String name) {
  return Container(
    height: MediaQuery.of(context).size.height - 2180.h,
    width: MediaQuery.of(context).size.width - 930.w,
    color: Colors.grey.shade300,
    child: Center(child: Text('$name')),
  );
}

Container colorProduct(BuildContext context, Color color) {
  return Container(
    height: MediaQuery.of(context).size.height - 2230.h,
    width: MediaQuery.of(context).size.width - 960.w,
    color: color,
    // child: Center(child: Text('$name')),
  );
}

TextStyle checkoutTitleText() {
  return TextStyle(
    fontSize: 60.sp,
    // fontWeight: FontWeight.bold,
  );
}

TextStyle checkoutTotalText() {
  return TextStyle(
    fontSize: 60.sp,
    fontWeight: FontWeight.bold,
  );
}
