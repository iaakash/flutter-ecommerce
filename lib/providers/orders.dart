import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart.dart';
import '../models/order-item.dart';


class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  // get OrderItem
   List<OrderItem> get orders {
      return [..._orders];
  }

  void addOrder(List<CartItem>cartProducts, double total) {
      _orders.insert(0,
        OrderItem(products:cartProducts,
         id: DateTime.now().toString(),
         createdAt: DateTime.now(),
         amount: total
         )
      );
      notifyListeners();
  }
}