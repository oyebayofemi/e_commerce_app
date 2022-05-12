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
    {required String amount,
    required String name,
    required String url,
    required bool isListProduct,
    required BuildContext context}) {
  return Card(
    child: Container(
      height: isListProduct
          ? MediaQuery.of(context).size.height - 675
          : MediaQuery.of(context).size.height - 580,
      // height: 100,
      width: MediaQuery.of(context).size.width - 220,
      // width: 200,
      // color: Colors.red,
      child: Column(
        children: [
          Container(
              height: isListProduct
                  ? MediaQuery.of(context).size.height - 675
                  : MediaQuery.of(context).size.height - 631,
              width: double.maxFinite,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              // color: Colors.blueGrey,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/$url',
                    )),
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
              Text('$name')
            ],
          )
        ],
      ),
    ),
  );
}

CircleAvatar homeCircleAvatar(Color color, String url) {
  return CircleAvatar(
    backgroundColor: color,
    radius: 100.r,
    child: Container(
      height: 130.h,
      child: Image(
        // color: Colors.red,
        image: AssetImage('assets/home_circle_avatar/$url'),
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
