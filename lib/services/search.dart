import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/providers/product_provider.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    List<Product> searchResults = productProvider.searchProductList(query);

    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      children: searchResults
          .map((e) => listProduct(
              amount: e.amount, url: e.url, name: e.name, context: context))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    List<Product> searchResults = productProvider.searchProductList(query);

    return GridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      children: searchResults
          .map((e) => listProduct(
              amount: e.amount, url: e.url, name: e.name, context: context))
          .toList(),
    );
  }
}
