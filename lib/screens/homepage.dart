import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/screens/list_product.dart';
import 'package:e_commerce_app/services.dart/authService.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Home Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
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
                height: MediaQuery.of(context).size.height - 610,
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
                height: MediaQuery.of(context).size.height - 750,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homeCircleAvatar(Colors.red.shade500, 'shirt_clip.png'),
                    homeCircleAvatar(Colors.green.shade400, 'gown_clipart.png'),
                    homeCircleAvatar(Colors.pinkAccent, 'shoe_clip.png'),
                    homeCircleAvatar(
                        Colors.blue.shade300, 'trouser_clip-art.png'),
                    homeCircleAvatar(Colors.yellow.shade300, 'tie-clipart.png'),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 760,
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
                                  builder: (context) =>
                                      ListProduct(name: 'Featured'),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    featuredProduct(
                        amount: '30.00',
                        name: 'Mens Jeans',
                        url: 'jeans.jpg',
                        isListProduct: false,
                        context: context),
                    featuredProduct(
                        amount: '50.00',
                        name: 'Mens Shirts',
                        url: 'shirt.jpg',
                        isListProduct: false,
                        context: context),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 770,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Achives',
                          style: featuredText(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ListProduct(name: 'Achives'),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    featuredProduct(
                        amount: '3000.00',
                        name: 'A Man Watch',
                        url: 'men_watch.jpeg',
                        isListProduct: false,
                        context: context),
                    featuredProduct(
                        amount: '500.00',
                        name: 'Mens Trousers',
                        url: 'men trousers.jpg',
                        isListProduct: false,
                        context: context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
