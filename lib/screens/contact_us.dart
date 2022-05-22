import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/services.dart/authService.dart';
import 'package:e_commerce_app/shared/toast.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ContactUsScreem extends StatefulWidget {
  const ContactUsScreem({Key? key}) : super(key: key);

  @override
  State<ContactUsScreem> createState() => _ContactUsScreemState();
}

class _ContactUsScreemState extends State<ContactUsScreem> {
  String? message;
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);

    userProvider.getUserData();

    var userData = userProvider.currentUserData;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Contact Us'),
      ),
      body: userData == null
          ? load()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      // color: Colors.blue,
                      height: MediaQuery.of(context).size.height - 2010.h,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Send us a message',
                        style: authText().copyWith(color: Colors.orange),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 1910.h,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          profileTextWidget('Name', userData.name!),
                          profileTextWidget('Email', userData.email!),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 1410.h,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.blue,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Message'),
                          onChanged: (value) => this.message = value,
                          maxLines: 200,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ButtonTheme(
                      buttonColor: Colors.orange,
                      minWidth: 500.w,
                      height: 150.h,
                      child: RaisedButton.icon(
                          onPressed: () {
                            if (message != null) {
                              AuthService().sendMessage(
                                  message!, userData.email!, userData.name!);
                              Navigator.pop(context);
                            } else {
                              showToast('Message is empty');
                            }
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Send Message',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
