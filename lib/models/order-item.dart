import '../providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime createdAt;

  OrderItem({this.id, this.amount, this.products, this.createdAt});
}