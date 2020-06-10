import 'package:flutter/material.dart';
import 'package:flutter_shop/models/order-item.dart' as OrderModel;
import 'package:intl/intl.dart'; 
import 'dart:math';

class OrderItem extends StatefulWidget {
  final OrderModel.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  
var _expanded = false;

  @override
  Widget build(BuildContext context) {
    var orderDetails = widget.order;

    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${orderDetails.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(orderDetails.createdAt),
            ), 
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if(_expanded) 
          Container(
            padding: EdgeInsets.all(10),
            height: min(orderDetails.products.length*50.0 + 10, 300),
            child: ListView.builder(
              itemCount: orderDetails.products.length,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        orderDetails.products[i].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                         Text(
                                '${orderDetails.products[i].quantity}x \$${orderDetails.products[i].price}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              )
                    ],
                  ),
                );
              }
              ),
          )
        ],
      ),
    );
  }
}