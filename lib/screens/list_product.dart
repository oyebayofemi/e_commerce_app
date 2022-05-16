import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  String name;
  final List<Product> snapshot;
  ListProduct({required this.name, required this.snapshot});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
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
      body: widget.snapshot == null
          ? load()
          : Padding(
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
                      child: GridView.count(
                        crossAxisCount: 2,
                        scrollDirection: Axis.vertical,
                        children: widget.snapshot
                            .map((e) => listProduct(
                                amount: e.amount,
                                url: e.url,
                                name: e.name,
                                context: context))
                            .toList(),
                      ))
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
