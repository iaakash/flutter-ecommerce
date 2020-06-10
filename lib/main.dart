import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/providers/orders.dart';
import 'package:flutter_shop/screens/cart.dart';
import 'package:flutter_shop/screens/edit-product.dart';
import 'package:flutter_shop/screens/json-parsing.dart';
import 'package:flutter_shop/screens/orders.dart';
import 'package:flutter_shop/screens/user-products.dart';
import 'package:provider/provider.dart';
import 'screens/product-detail.dart';
import 'screens/product-list.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // home: ProductList(),
        // home: EditProduct(),
        
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.deepOrangeAccent,
            fontFamily: 'Lato'),
        routes: {
          // '/': (ctx) => JsonParsing(),
          '/': (ctx) => EditProduct(),
          // EditProduct.routeName: (ctx) => EditProduct(),
          ProductList.routeName: (ctx) => ProductList(),
          ProductDetail.routeName: (ctx) => ProductDetail(),
          CartPage.routeName: (ctx) => CartPage() ,
          OrdersPage.routeName: (ctx) => OrdersPage(), 
          UserProducts.routeName: (ctx) => UserProducts(),
          EditProduct.routeName: (ctx) => EditProduct(),
          JsonParsing.routeName: (ctx) => JsonParsing()
          },
      ),
    );
  }
}
