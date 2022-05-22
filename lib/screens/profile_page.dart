import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/userModel.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/screens/homepage.dart';
import 'package:e_commerce_app/services/authService.dart';
import 'package:e_commerce_app/services/storage.dart';

import 'package:e_commerce_app/shared/toast.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:e_commerce_app/shared/widget/notification_widget.dart';
import 'package:e_commerce_app/utils/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? phone, name;
  bool edit = false;
  bool isloading = true;
  Uint8List? _image;
  StorageMethods storageMethods = StorageMethods();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  selectImageCamera() async {
    Uint8List im = await pickImage(ImageSource.camera);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  selectImageGallery() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  uploadToFirebase() async {
    try {
      String url = await storageMethods.uploadFile(
          _image!); // this will upload the file and store url in the variable 'url'
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        //use update to update the doc fields.
        'url': url
      });
      showToast('Success');
    } catch (e) {
      print(e.toString());
      showToast('Couldnt Upload file');
    }
  }

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
            : IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                icon: Icon(Icons.arrow_back)),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          edit == false
              ? NotificationButton()
              : IconButton(
                  onPressed: () async {
                    setState(() {
                      isloading = true;
                    });

                    if (name == null) {
                      name = userData?.name!;
                    }
                    if (phone == null) {
                      phone = userData?.phoneNO!;
                    }

                    await AuthService().updateUserProfile(name!, phone!);

                    setState(() {
                      isloading = false;
                      edit = false;
                    });
                  },
                  icon: Icon(Icons.check)),
        ],
      ),
      body: SingleChildScrollView(
        child: userData == null
            ? load()
            : isloading == true
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
                                  backgroundImage: NetworkImage(userData.url ??
                                      'https://i.stack.imgur.com/l60Hf.png'),
                                ),
                              ],
                            ),
                          ),
                          if (edit == true)
                            Positioned(
                              height: 800.h,
                              left: 600.w,
                              child: GestureDetector(
                                onTap: () async {
                                  await showModalBottomSheet(
                                      context: context,
                                      builder: (builder) => bottomSheet());

                                  await uploadToFirebase();
                                },
                                child: CircleAvatar(
                                  radius: 50.r,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.edit),
                                ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  profileTextWidget('Name', userData.name!),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextFormField(
                                    initialValue: userData.name!,
                                    onChanged: (value) => this.name = value,
                                    validator: (value) => value!.isEmpty
                                        ? 'Name Field cant be empty'
                                        : null,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: profileTextFormDecoration(),
                                  ),
                                  profileTextWidget('Email', userData.email!),
                                  TextFormField(
                                    initialValue: userData.phoneNO!,
                                    onChanged: (value) => this.phone = value,
                                    validator: (value) => value!.isEmpty
                                        ? 'Phone Field cant be empty'
                                        : null,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    decoration: profileTextFormDecoration(),
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

  Widget bottomSheet() {
    return Container(
      height: 70,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton.icon(
                    onPressed: () async {
                      await selectImageCamera();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.camera_alt),
                    label: Text('Camera')),
              ),
              Expanded(
                child: FlatButton.icon(
                    onPressed: () async {
                      await selectImageGallery();
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.photo_size_select_actual_rounded),
                    label: Text('Gallery')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
