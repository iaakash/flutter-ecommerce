import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/json-parsing.dart';
import 'package:flutter_shop/screens/orders.dart';
import 'package:flutter_shop/screens/user-products.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Shopping Cart'),
            automaticallyImplyLeading: false,
          ), 
          Divider(),
           ListTile(
            leading: Icon(Icons.refresh),
            title: Text('Serialise/Deserlise'),
            onTap: () {
              Navigator.of(context).pushNamed(JsonParsing.routeName);
            },
          ), 
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ), 
           ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushNamed(OrdersPage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.collections),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context).pushNamed(UserProducts.routeName);
            },
          )
        ],
      ),
    );
  }
}