import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool showFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    showFav = true;
                  } else {
                    showFav = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text(
                        'Only Favorites',
                      ),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text(
                        'Show All',
                      ),
                      value: FilterOptions.All,
                    ),
                  ]),
        ],
      ),
      body: ProductGrid(showFav),
    );
  }
}
