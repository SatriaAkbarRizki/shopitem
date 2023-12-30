import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopitem/model/productmodel.dart';
import 'package:shopitem/providers/cart_item.dart';

import '../screen/product_detail.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final getProduct = Provider.of<ProductModel>(context, listen: false);
    final triggerItem = Provider.of<CartProvider>(context, listen: true);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // ignore: sort_child_properties_last
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetail.routeProductDetail,
              arguments: getProduct.id,
            );
          },
          child: Image.network(
            getProduct.image!,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<ProductModel>(
            builder: (ctx, value, child) => IconButton(
              icon: value.isFavorit
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined),
              color: Theme.of(context).hintColor,
              onPressed: () {
                value.changeFavorit();
              },
            ),
          ),
          title: Text(
            getProduct.title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Add to Cart')));
              triggerItem.addItem(
                  getProduct.id!, getProduct.title!, getProduct.price!);
            },
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}


/*******************************************************************************************************
 
 * Dari kode diatas kita memakai code ini untuk mengambil data maupun untuk perubahan data             *
 * final getProduct = Provider.of<ProductModel>(context);                                              *
 * namun dengan cara begitu  akan selalu membuat ulang widget ketika ada perubahan data, nah bagaimana *
 * cara nya agar tidak rebuild widget?? cara nya adalah dengan memakai consume pada iconbutton yang    *
 * perlu mengubah data dan pada getProduct kita harus memberikan listen nya false                      *
 * dengan cara begitu tidak akan selalu rebuild ketika ada perubahan data     
                         *
 *******************************************************************************************************/
