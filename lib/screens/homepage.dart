import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/category_icon.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/providers/category_provider.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/providers/user_provider.dart';
import 'package:e_commerce_app/screens/cartpage.dart';
import 'package:e_commerce_app/screens/list_product.dart';
import 'package:e_commerce_app/services.dart/authService.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:e_commerce_app/shared/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final images = [
    AssetImage('assets/fifa.jpg'),
    AssetImage('assets/bluetooth.jpg'),
    AssetImage('assets/jeans.jpg'),
    AssetImage('assets/bed.jpg'),
    AssetImage('assets/shirt.jpg'),
  ];
  bool homeColor = true;
  bool contactColor = false;

  bool aboutColor = false;
  bool cartColor = false;

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();

    var userData = userProvider.currentUserData;

    CategoryProvider categoryProvider = Provider.of(context);
    categoryProvider.getShirtData();
    categoryProvider.geTieData();
    categoryProvider.getDressData();
    categoryProvider.getShoeData();
    categoryProvider.getTrouserData();

    List<Product> shirt = categoryProvider.getShirtList;
    List<Product> shoe = categoryProvider.getShoeList;
    List<Product> trouser = categoryProvider.getTrouserList;
    List<Product> dress = categoryProvider.getdressList;
    List<Product> tie = categoryProvider.getTieList;

    ProductProvider productProvider = Provider.of(context);
    productProvider.getAchieveData();
    productProvider.getfeatureData();

    List<Product> feature = productProvider.getFeatureList;
    List<Product> achieve = productProvider.getAchieveList;

    categoryProvider.getCategoryIconData();
    List<CategoryIcon> categoryIcon = categoryProvider.getCategoryList;

    // print(categoryIcon);

    // print(categoryIcon.elementAt(0).name);
    // print(categoryIcon.elementAt(1).name);
    // print(categoryIcon.elementAt(2).name);
    // print(categoryIcon.elementAt(3).name);
    // print(categoryIcon.elementAt(4).name);

    // print(categoryIcon.elementAt(1).image);
    // print(categoryIcon.elementAt(2).image);
    // print(categoryIcon.elementAt(3).image);
    // print(categoryIcon.elementAt(4).image);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Home Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          NotificationButton(),
        ],
      ),
      body: Container(
        // color: Colors.pink,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 1610.h,
                // color: Colors.blue,
                child: CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = images[index];
                      return carouselBuild(urlImage, index);
                    },
                    options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3))),
              ),
              Container(
                // color: Colors.blue,
                height: MediaQuery.of(context).size.height - 2150.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: featuredText(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: categoryIcon.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          homeCircleAvatar(
                              Colors.green.shade400,
                              categoryIcon.elementAt(0).image,
                              'Dress',
                              dress,
                              context),
                          homeCircleAvatar(
                              Colors.red.shade500,
                              categoryIcon.elementAt(1).image,
                              'Shirt',
                              shirt,
                              context),
                          homeCircleAvatar(
                              Colors.pinkAccent,
                              categoryIcon.elementAt(2).image,
                              'Shoe',
                              shoe,
                              context),
                          homeCircleAvatar(
                              Colors.yellow.shade300,
                              categoryIcon.elementAt(3).image,
                              'Tie',
                              tie,
                              context),
                          homeCircleAvatar(
                              Colors.blue.shade300,
                              categoryIcon.elementAt(4).image,
                              'Trouser',
                              trouser,
                              context),
                        ],
                      )
                    : load(),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       homeCircleAvatar(Colors.red.shade500, 'shirt_clip.png',
              //           'Shirt', shirt, context),
              //       homeCircleAvatar(Colors.green.shade400, 'gown_clipart.png',
              //           'Dress', dress, context),
              //       homeCircleAvatar(Colors.pinkAccent, 'shoe_clip.png', 'Shoe',
              //           shoe, context),
              //       homeCircleAvatar(Colors.blue.shade300,
              //           'trouser_clip-art.png', 'Trouser', trouser, context),
              //       homeCircleAvatar(Colors.yellow.shade300, 'tie-clipart.png',
              //           'Tie', tie, context),
              //     ],
              //   ),
              // ),
              Container(
                height: MediaQuery.of(context).size.height - 2190.h,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Featured',
                          style: featuredText(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListProduct(
                                      name: 'Featured', snapshot: feature),
                                ));
                          },
                          child: Text(
                            'Show All',
                            style: featuredText(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: feature.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct(
                              amount: feature.elementAt(0).amount,
                              name: feature.elementAt(0).name,
                              url: feature.elementAt(0).url,
                              // isListProduct: false,
                              context: context),
                          featuredProduct(
                              amount: feature.elementAt(1).amount,
                              name: feature.elementAt(1).name,
                              url: feature.elementAt(1).url,
                              // isListProduct: false,
                              context: context),
                        ],
                      )
                    : load(),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 2200.h,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Achives',
                          style: featuredText(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListProduct(
                                      name: 'Achives', snapshot: achieve),
                                ));
                          },
                          child: Text(
                            'Show All',
                            style: featuredText(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: achieve.isEmpty
                    ? load()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProduct(
                              amount: achieve.elementAt(0).amount,
                              name: achieve.elementAt(0).name,
                              url: achieve.elementAt(0).url,
                              // isListProduct: false,
                              context: context),
                          featuredProduct(
                              amount: achieve.elementAt(1).amount,
                              name: achieve.elementAt(1).name,
                              url: achieve.elementAt(1).url,
                              // isListProduct: false,
                              context: context),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            userData?.name == null
                ? load()
                : UserAccountsDrawerHeader(
                    accountName: Text(
                      userData!.name!,
                      style: TextStyle(color: Colors.white),
                    ),
                    accountEmail: Text(
                      userData.email!,
                      style: TextStyle(color: Colors.white),
                    ),
                    currentAccountPicture: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/account_image.png')),
                  ),
            ListTile(
                onTap: () {
                  homeColor = true;
                  aboutColor = false;
                  cartColor = false;
                  contactColor = false;
                },
                selected: homeColor,
                leading: Icon(Icons.home),
                title: Text('Home')),
            ListTile(
                onTap: () {
                  homeColor = false;
                  aboutColor = false;
                  cartColor = true;
                  contactColor = false;
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => CartPage(),
                  //     ));
                },
                selected: cartColor,
                leading: Icon(Icons.shopping_cart),
                title: Text('Cart')),
            ListTile(
                onTap: () {
                  homeColor = false;
                  aboutColor = true;
                  cartColor = false;
                  contactColor = false;
                },
                selected: aboutColor,
                leading: Icon(Icons.info),
                title: Text('About')),
            ListTile(
                onTap: () {
                  homeColor = false;
                  aboutColor = false;
                  cartColor = false;
                  contactColor = true;
                },
                selected: contactColor,
                leading: Icon(Icons.phone),
                title: Text('Contact US')),
            ListTile(leading: Icon(Icons.logout), title: Text('Logout')),
          ],
        ),
      ),
    );
  }
}
