import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/products.dart';
import 'package:flutter_shop/screens/edit-product.dart';
import 'package:flutter_shop/widgets/app-drawer.dart';
import 'package:flutter_shop/widgets/user-product-item.dart';
import 'package:provider/provider.dart';


class UserProducts extends StatelessWidget {
  static const routeName = '/user-products';
  @override
  Widget build(BuildContext context) {
    final productsInstance = Provider.of<Products>(context);
    print(productsInstance.items);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('User Products'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Navigator.of(context).pushNamed(EditProduct.routeName);
          })
        ],
      ),
      body: ListView.builder(
        itemCount: productsInstance.items.length,
        itemBuilder: (_, i) => Column(
          children: <Widget>[
            // Text(productsInstance.items[i].title),
            // Image.network(productsInstance.items[i].imageUrl),
            UserProductItem(
              id: productsInstance.items[i].id,
              title:  productsInstance.items[i].title,
              imageUrl:productsInstance.items[i].imageUrl ,
              ),
          ],
          
        )
        ),
    );
  }
}