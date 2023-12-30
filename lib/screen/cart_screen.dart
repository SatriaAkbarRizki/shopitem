import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopitem/providers/cart_item.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Item')),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Total: \$${cartItem.totalHarga}",
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: cartItem.items.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(cartItem.items.values.toList()[index].title),
              subtitle: Text(
                  "Jumlah Item: ${cartItem.items.values.toList()[index].qty.toString()}"),
              trailing: Container(
                child: Text(
                    " ${cartItem.items.values.toList()[index].qty * cartItem.items.values.toList()[index].price}"),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
