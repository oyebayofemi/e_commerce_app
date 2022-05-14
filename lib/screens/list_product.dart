import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  String name;
  ListProduct({required this.name});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  CollectionReference featuredProductData = FirebaseFirestore.instance
      .collection('products')
      .doc('hLWQUcBxUXPezSJEctw6')
      .collection('featuredProducts');

  CollectionReference achivesProductData = FirebaseFirestore.instance
      .collection('products')
      .doc('hLWQUcBxUXPezSJEctw6')
      .collection('achivesProduct');

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
                child: widget.name == 'Achives'
                    ? StreamBuilder<QuerySnapshot>(
                        stream: achivesProductData.snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot?> snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                                itemCount: snapshot.data!.docs.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 4.0,
                                        mainAxisSpacing: 4.0),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot dsnapshot =
                                      snapshot.data!.docs[index];

                                  var data = Product(
                                      amount: dsnapshot['amount'],
                                      name: dsnapshot['name'],
                                      url: dsnapshot['url']);
                                  return featuredProduct(
                                      amount: '${data.amount}',
                                      name: data.name,
                                      url: data.url,
                                      isListProduct: true,
                                      context: context);
                                });
                          } else {
                            return load();
                          }
                        })
                    : StreamBuilder<QuerySnapshot>(
                        stream: featuredProductData.snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot?> snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                                itemCount: snapshot.data!.docs.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 4.0,
                                        mainAxisSpacing: 4.0),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot dsnapshot =
                                      snapshot.data!.docs[index];

                                  var data = Product(
                                      amount: dsnapshot['amount'],
                                      name: dsnapshot['name'],
                                      url: dsnapshot['url']);
                                  return featuredProduct(
                                      amount: '${data.amount}',
                                      name: data.name,
                                      url: data.url,
                                      isListProduct: true,
                                      context: context);
                                });
                          } else {
                            return load();
                          }
                        }))
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
