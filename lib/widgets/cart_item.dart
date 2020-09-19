import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  CartItem({this.id, this.price, this.quantity, this.title, this.productId});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context).remove(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(
                'Are You sure?',
              ),
              content: Text('Do you really wanna remove this item?'),
              actions: [
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.of(ctx).pop(true),
                ),
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.of(ctx).pop(false),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 5,
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                child: FittedBox(
                  child: Text('$price'),
                ),
                padding: EdgeInsets.all(5),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('${quantity}x'),
          ),
        ),
      ),
    );
  }
}
