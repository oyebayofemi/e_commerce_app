import 'package:e_commerce_app/model/userModel.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:e_commerce_app/shared/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool edit = false;
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);

    userProvider.getUserData();

    var userData = userProvider.currentUserData;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Profile Page'),
        leading: edit == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
                icon: Icon(Icons.cancel))
            : IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          edit == false
              ? NotificationButton()
              : IconButton(
                  onPressed: () {
                    setState(() {
                      edit = false;
                    });
                  },
                  icon: Icon(Icons.check)),
        ],
      ),
      body: SingleChildScrollView(
        child: userData?.name == null
            ? load()
            : Column(
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        height: 440.h,
                        width: MediaQuery.of(context).size.width,
                        // color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              maxRadius: 160.r,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: NetworkImage(
                                  'https://i.stack.imgur.com/l60Hf.png'),
                            ),
                          ],
                        ),
                      ),
                      if (edit == true)
                        Positioned(
                          height: 800.h,
                          left: 600.w,
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  edit == false
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          // color: Colors.blue,
                          height: 800.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              profileTextWidget('Name', userData!.name!),
                              profileTextWidget('Email', userData.email!),
                              profileTextWidget(
                                  'Phone Number', userData.phoneNO!),
                            ],
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          // color: Colors.blue,
                          height: 800.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextFormField(
                                decoration:
                                    InputDecoration(hintText: userData!.name!),
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(hintText: userData.email!),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: userData.phoneNO!),
                              ),
                            ],
                          ),
                        ),
                  Container(
                    height: 400.h,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonTheme(
                          buttonColor: Colors.orange,
                          minWidth: 500.w,
                          height: 150.h,
                          child: RaisedButton.icon(
                              onPressed: () {
                                setState(() {
                                  edit = true;
                                });
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Edit Profile',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
