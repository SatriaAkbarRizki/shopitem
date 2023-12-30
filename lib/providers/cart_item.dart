import 'package:flutter/material.dart';
import 'package:shopitem/model/cartmodel.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _items = {};
  Map<String, CartModel> get items => _items;

  int get jumlahItem => items.length;
  double get totalHarga {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.qty * value.price;
    });

    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartModel(
              id: value.id,
              title: value.title,
              price: value.price,
              qty: value.qty + 1));
    } else {
      _items.putIfAbsent(productId,
          () => CartModel(id: DateTime.now().toString(), title: title, price: price, qty: 1));
    }
    notifyListeners();
  }
}
