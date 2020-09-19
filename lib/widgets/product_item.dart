import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

import '../provider/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            leading: Consumer<Product>(
              builder: (context, value, child) => IconButton(
                color: Theme.of(context).accentColor,
                icon: Icon(
                  product.isFav ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  product.toggleFav();
                },
              ),
            ),
            trailing: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                cart.addItem(product.id, product.title, product.price);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item Added to Cart'),
                    action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          cart.removeItem(product.id);
                        }),
                  ),
                );
              },
            ),
          )),
    );
  }
}
