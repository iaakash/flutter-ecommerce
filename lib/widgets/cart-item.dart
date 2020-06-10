import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String cartId;
  final String title;
  final double price;
  final int quantity;

  CartItem({this.id, this.price, this.quantity, this.title, this.cartId});

  @override
  Widget build(BuildContext context) {
    final cartInstance = Provider.of<Cart>(context);

    // final currentProduct = Provider.of<Products>(context, listen: false).findById(productId);
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(id),
      background: Container(
        color: Colors.red,
        child: Icon(Icons.restore_from_trash,
            color: Color.fromRGBO(255, 255, 255, 1)),
        alignment: Alignment.centerRight,
      ),
      onDismissed: (direction) {
        cartInstance.deleteItem(cartId);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text(
                  'Do you want to remove the item from the cart?',
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                  ),
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                  ),
                ],
              ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(
                  child: Text('\$${price}'),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(quantity * price)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
