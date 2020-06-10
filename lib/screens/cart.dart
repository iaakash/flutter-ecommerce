import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/orders.dart';
import 'package:flutter_shop/widgets/app-drawer.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart-item.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartInstance = Provider.of<Cart>(context);
     final orderInstance = Provider.of<Orders>(context, listen: false);

    void _orderItems() {
        orderInstance.addOrder(cartInstance.items.values.toList(), cartInstance.total);
        cartInstance.resetCart();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Chip(label: Text(cartInstance.total.toString())),
                    FlatButton(onPressed: _orderItems, child: Text('Order Now'))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cartInstance.itemCount,
                  itemBuilder: (ctx, i) => CartItem(
                    cartId:cartInstance.items.keys.toList()[i],
                      id: cartInstance.items.values.toList()[i].id,
                      title:  cartInstance.items.values.toList()[i].title,
                      quantity: cartInstance.items.values.toList()[i].quantity,
                      price: cartInstance.items.values.toList()[i].price)))
        ],
      ),
    );
  }
}
