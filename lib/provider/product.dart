import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final double price;
  bool isFav;

  Product(
      {@required this.description,
      @required this.id,
      @required this.imageUrl,
      this.isFav = false,
      @required this.price,
      @required this.title});

  void toggleFav() {
    isFav = !isFav;
    notifyListeners();
  }
}
