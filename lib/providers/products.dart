import 'package:flutter/material.dart';
import 'package:flutter_shop/mock/productList.dart';
import '../providers/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {

  
  bool _isFavorites = false;

  List<Product> _items = DUMMY_PRODUCTS;

  // getter
  List<Product> get items {
    return [..._items];
  }

  List<Product> get favorites {
    return [..._items].where((element) => element.isFavorite == true).toList();
  }

  Future addProductToRemote(Product product) {
    const url = 'https://flutter-shop19.firebaseio.com/products.json';

    Map<String, dynamic> productMap = product.toJson();
    String rawProductJson = jsonEncode(productMap);
    
    print(rawProductJson);

    return http.post(url,  body: rawProductJson);
  }

  addProductToStore(Product product) {
      _items.add(product);
    notifyListeners();
  }

  showFavorites() {
    _isFavorites = true;
    notifyListeners();
  }

  showAll() {
    _isFavorites = false;
    notifyListeners();
  }

  Product findById(String id) {
    return items.firstWhere((item) => item.id == id);
  }
}