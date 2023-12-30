import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopitem/providers/cart_item.dart';
import 'package:shopitem/screen/cart_screen.dart';
import 'package:shopitem/widget/badge.dart';
import '../providers/listproduct.dart';
import '../widget/product_item.dart';

class ProductOverview extends StatelessWidget {
  const ProductOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, ch) {
              return BadgeItem(
                value: value.jumlahItem.toString(),
                child: ch!,
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ListProductsProvider>(context);
    final getProduct = productData.getAllItem;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: getProduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: getProduct[index], child: const ProductItem()),
    );
  }
}




/***********************************************************************************************************************
 
 * Apa perbedaan antara ChangeNotifierProvider dan ChangeNotifierProvider.value??                                      *
 * Perbedaan nya adalah kalau ChangeNotifierProvider si provider akan mengambil data dari class                        *
 * sedangkan ChangeNotifierProvider.value si provider akan mengambil dari sebuah list                                  *
 * dan satu lagi kalau pakai ChangeNotifierProvider.value kita gak perlu tuh memakai constructor pada class yang ditunjukkan *
 
 ***********************************************************************************************************************/

