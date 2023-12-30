import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  String? id;
  String? title;
  double? price;
  String? image;
  String? description;
  bool isFavorit;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.description,
      this.isFavorit = false});

  void changeFavorit() {
    isFavorit = !isFavorit;
    notifyListeners();
  }
}

/* 
  Ini disebut dengan nested model provider
  Kenapa harus implementasikan ChangeNotifier pada model??
  Karena pada kasus ini kita akan mengubah value isFavorit secara langsung tanpa melalui list
  dan tidak menggunakan constructor lagi pada product item
*/

