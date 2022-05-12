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
