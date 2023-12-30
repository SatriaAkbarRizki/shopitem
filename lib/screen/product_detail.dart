import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopitem/providers/cart_item.dart';
import 'package:shopitem/providers/listproduct.dart';
import 'package:shopitem/screen/cart_screen.dart';
import 'package:shopitem/widget/badge.dart';

class ProductDetail extends StatelessWidget {
  static String routeProductDetail = '/productDetail';

  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final product =
        Provider.of<ListProductsProvider>(context).findById(productId);
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, ch) {
              return BadgeItem(
                child: ch!,
                value: value.jumlahItem.toString(),
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${product.image}",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "${product.title}",
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "\$${product.price}",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "${product.description}",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Berhasil ditambahkan"),
                  duration: Duration(
                    milliseconds: 500,
                  ),
                ),
              );
              cart.addItem(product.id!, product.title!, product.price!,);
            },
            child: const Text(
              "Add to cart",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
