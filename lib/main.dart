import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopitem/providers/cart_item.dart';
import 'package:shopitem/providers/listproduct.dart';
import 'package:shopitem/screen/cart_screen.dart';
import 'package:shopitem/screen/product_detail.dart';
import 'package:shopitem/screen/product_overview.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListProductsProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          hintColor: Colors.amber,
        ),
        home: const ProductOverview(),
        routes: {
          ProductDetail.routeProductDetail: (ctx) => const ProductDetail(),
          CartScreen.routeName: (ctx) => const CartScreen()
        },
      ),
    );
  }
}
