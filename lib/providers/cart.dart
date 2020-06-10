import 'package:flutter/foundation.dart';


class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get total {
    double total = 0.0;
_items.forEach((key, cartItem) {
  return total += cartItem.quantity * cartItem.price;
});
return total;
  }

  // adding an item to map
  void addItem(
    String productId,
    double price,
    String title
  ) {
    if(_items.containsKey(productId)) {
      _items.update(productId, (existingCartItem) => CartItem(id: existingCartItem.id, title: existingCartItem.title, quantity: existingCartItem.quantity+1, price: existingCartItem.price));
    }else {
      _items.putIfAbsent(productId, () => CartItem(id: DateTime.now().toString(), title: title, quantity: 1, price:price));
    }
    notifyListeners();
  } 

  deleteItem(String id) {
    this._items.remove(id);
    notifyListeners();
  }

  removeSingleItemById(String productId) {
      if(!_items.containsKey(productId)) {
        return;
      }
      if(_items[productId].quantity > 1) {
          _items.update(productId, (existingProduct) => CartItem(id: existingProduct.id, title: existingProduct.title, quantity: existingProduct.quantity - 1, price: existingProduct.price));  
          }
          else {
            _items.remove(productId);
          }
          notifyListeners();
      }

  resetCart() {
    this._items = {};
     notifyListeners();
  }
  
}