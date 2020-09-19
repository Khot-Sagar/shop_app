import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double totalAmot = 0.0;
    _items.forEach((key, cart) {
      totalAmot += cart.quantity * cart.price;
    });
    return totalAmot;
  }

  void addItem(String id, String title, double price) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (value) => CartItem(
            id: value.id,
            title: value.title,
            price: value.price,
            quantity: value.quantity + 1),
      );
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  void remove(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
        id,
        (value) => CartItem(
          id: value.id,
          price: value.price,
          quantity: value.quantity - 1,
          title: value.title,
        ),
      );
    } else {
      _items.remove(id);
    }
  }
}
