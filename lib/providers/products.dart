import 'package:flutter/material.dart';
import 'package:flutter_shop/mock/productList.dart';
import '../providers/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  bool _isFavorites = false;

  List<Product> _items = [];

  // getter
  List<Product> get items {
    return [..._items];
  }

  List<Product> get favorites {
    return [..._items].where((element) => element.isFavorite == true).toList();
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = 'https://flutter-shop19.firebaseio.com/products/$id.json';
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price
          }));
      _items[prodIndex] = newProduct;

      notifyListeners();
    } else {
      print('...');
    }
  }


  fetchProducts() async {
    const url = 'https://flutter-shop19.firebaseio.com/products.json';
    var response = await http.get(url);

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Product> loadedProducts = [];

    extractedData.forEach((key, productItem) {
      Product product = Product(
          id: key,
          title: productItem['title'],
          description: productItem['description'],
          price: productItem['price'],
          imageUrl: productItem['imageUrl']);
          loadedProducts.add(product);
    });
    _items = loadedProducts;

    notifyListeners();
  }

  Future<void> addProductToRemote(Product product) async {
    const url = 'https://flutter-shop19.firebaseio.com/products.json';

    Map<String, dynamic> productMap = product.toJson();
    String rawProductJson = jsonEncode(productMap);

    try {
      // code block which might produce an error
      final response = await http.post(url, body: rawProductJson);
      final Product _newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);

      this.addProductToStore(_newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
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
    items;

    Product selectedProduct = items.firstWhere((item) => item.id == id);
    return selectedProduct;
  }
}
