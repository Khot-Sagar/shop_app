import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static final String routeName = '/product_detail_screen';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
