import 'package:e_commerce_app/shared/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('About Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // color: Colors.blue,
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Container(
                  // color: Colors.blue,
                  height: 700.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            'https://pishondesigns.org/Dbase/wp-content/uploads/2018/01/online-shopping-ecommerce-ss-1920.png')),
                  )),
              aboutText(context, 'Leadership Principles',
                  'Our Leadership Principles are more than inspirational wall hangings. The 16 principles guide our discussions and decisions every day.'),
              aboutText(context, 'Our Positions',
                  'While our positions are carefully considered and deeply held, there is much room for healthy debate and differing opinions. We hope being clear about our positions is helpful.'),
              aboutText(context, 'Awards and Recognition',
                  'We are honored to be recognized for the work we do on behalf of our customers, employees, and communities every day.'),
            ],
          ),
        ),
      ),
    );
  }
}
