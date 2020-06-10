import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/orders.dart';
import 'package:flutter_shop/widgets/app-drawer.dart';
import 'package:flutter_shop/widgets/order-item.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class OrdersPage extends StatefulWidget {
  static const routeName = '/orders';
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {


  @override
  Widget build(BuildContext context) {
      final ordersInstance = Provider.of<Orders>(context);
      print(ordersInstance.orders.length );
      // print(ordersInstance.orders[0].products.toList()); 
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: ordersInstance.orders.length ,
        itemBuilder: (ctx, i) => OrderItem(ordersInstance.orders[i])
        
        )
    );
  }
}