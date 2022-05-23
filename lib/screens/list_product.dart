import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/services/search.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:e_commerce_app/shared/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    ProductProvider productProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                productProvider.getSearchList(list: widget.snapshot);
                showSearch(context: context, delegate: Search());
              },
              icon: Icon(Icons.search)),
          NotificationButton(),
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
