import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/side_drawer.dart';
import '../widgets/user_product_item.dart';
import '../provider/products.dart';

class UserProductsScreen extends StatelessWidget {
  static final String routeName = '/user_products';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      drawer: SideDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => UserProductItem(
              productsData.items[i].title, productsData.items[i].imageUrl),
        ),
      ),
    );
  }
}
