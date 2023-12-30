import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopitem/model/productmodel.dart';

class ListProductsProvider with ChangeNotifier {
  final List<ProductModel> _list = List.generate(
      25,
      (index) => ProductModel(
          id: index.toString(),
          title: "Product: ${index + 1}",
          price: 10 + Random().nextInt(100).toDouble(),
          description: 'Ini adalah product No: ${index + 1}',
          image: 'https://picsum.photos/id/$index/200/300'));

  List<ProductModel> get getAllItem => _list;

  ProductModel findById(String id) {
    return getAllItem.firstWhere((element) => element.id == id);
  }
}
