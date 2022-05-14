import 'package:e_commerce_app/shared/widget.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  String name;
  ListProduct({required this.name});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  final List<ListProductData> menu = [
    ListProductData('5000.00', 'Belt', 'jeans.jpg'),
    ListProductData('12,000.00', 'King size Bed', 'bed.jpg'),
    ListProductData('5000.00', 'Bluetooth Headphones', 'bluetooth.jpg'),
    ListProductData('5000.00', 'A Full Clipper Set', 'clipper.jpeg'),
    ListProductData('5000.00', 'FIFA 21', 'fifa.jpg'),
    ListProductData('5000.00', 'Ipone 11', 'iphone.jpeg'),
    ListProductData('5000.00', 'Ipone 11', 'iphone.jpeg'),
    ListProductData('5000.00', 'Ipone 11', 'iphone.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: featuredText(),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 05),
              // color: Colors.blue,
              height: MediaQuery.of(context).size.height - 122,
              child: GridView.builder(
                  itemCount: menu.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (context, index) {
                    return featuredProduct(
                        amount: menu[index].amount,
                        name: menu[index].name,
                        url: menu[index].url,
                        isListProduct: true,
                        context: context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ListProductData {
  ListProductData(this.amount, this.name, this.url);
  final String amount;
  final String url;
  final String name;
}
