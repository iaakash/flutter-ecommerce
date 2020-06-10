import 'package:flutter/material.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_shop/providers/address.dart';
import 'package:flutter_shop/providers/friend.dart';
import 'package:flutter_shop/providers/photos.dart';
import 'package:flutter_shop/providers/product-example.dart';
import 'package:flutter_shop/providers/shape.dart';
import 'dart:convert';
import '../providers/friend.dart';

class JsonParsing extends StatelessWidget {
  static const routeName = '/json-parsing';

  Future<String> _loadFriendJson() async {
    return await rootBundle.loadString('assets/friends-list.json');
  }

  Future<String> _loadAddressJson() async {
    return await rootBundle.loadString('assets/address.json');
  }

  Future<String> _loadShapeJson() async {
    return await rootBundle.loadString('assets/shape.json');
  }

  Future<String> _loadProductJson() async {
    return await rootBundle.loadString('assets/product.json');
  }

   Future<String> _loadPhotosJson() async {
    return await rootBundle.loadString('assets/photos.json');
  }

   Future<String> _loadUsersJson() async {
    return await rootBundle.loadString('assets/users.json');
  }


  Future loadUsers() async {
    String jsonString = await _loadUsersJson();
    final Map<String, dynamic> jsonResponse = json.decode(jsonString); // So this creates a Map of String and Dynamic
    // PhotoList photoList = PhotoList.fromJson(jsonResponse); // this converts fromJsonto -> Dart Object
    // // print(friend); // this will give instance of Friend
    // // print(friend.age);
    // print(jsonResponse);
    // print(photoList);
    print(jsonResponse);
  }

Future loadPhotos() async {
    String jsonString = await _loadPhotosJson();
    final List<dynamic> jsonResponse = json.decode(jsonString); // So this creates a Map of String and Dynamic
    PhotoList photoList = PhotoList.fromJson(jsonResponse); // this converts fromJsonto -> Dart Object
    // print(friend); // this will give instance of Friend
    // print(friend.age);
    print(jsonResponse);
    print(photoList);
  }



  

  Future loadAddress() async {
    String jsonString = await _loadAddressJson();
    final Map<String, dynamic> jsonResponse =
        json.decode(jsonString); // So this creates a Map of String and Dynamic
    Address address = Address.fromJson(
        jsonResponse); // this converts fromJsonto -> Dart Object
    print(address); // this will give instance of Friend
    print(address.streets);
    print(jsonResponse);
    print(jsonResponse['streets']);
  }

  Future loadShape() async {
    String jsonString = await _loadShapeJson();
    final Map<String, dynamic> jsonResponse =
        json.decode(jsonString); // So this creates a Map of String and Dynamic
    Shape shape =
        Shape.fromJson(jsonResponse); // this converts fromJsonto -> Dart Object
    print(shape); // this will give instance of Friend
    print(jsonResponse);
  }


 Future loadProduct() async {
    String jsonString = await _loadProductJson();
    final Map<String, dynamic> jsonResponse =
        json.decode(jsonString); // So this creates a Map of String and Dynamic
    Product product = Product.fromJson(jsonResponse); // this converts fromJsonto -> Dart Object
    print(product); // this will give instance of Friend
    print(jsonResponse);
  }

  Future loadFriend() async {
    String jsonString = await _loadFriendJson();
    final Map<String, dynamic> jsonResponse = json.decode(jsonString);
     // So this creates a Map of String and Dynamic
    Friend friend = Friend.fromJson(jsonResponse); // this converts fromJsonto -> Dart Object

    print(friend); // this will give instance of Friend

    // converting FriendDart Object to Json

    // Step1. Convert it into Raw Map or List
    Map<String, dynamic> friendMap = friend.toJson();
    // Step2 use encode to use it as jsonString
    String rawFriendJson = jsonEncode(friendMap);

    // print(friend.age);
    print(rawFriendJson);
    // print(jsonResponse['age']);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Parsing'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text('Json Parsing'),
          ),
          FlatButton(onPressed: loadFriend, child: Text('Make Friend Call')),
          FlatButton(onPressed: loadAddress, child: Text('Fetch Address')),
          FlatButton(onPressed: loadShape, child: Text('Fetch Shape')),
          FlatButton(onPressed: loadProduct, child: Text('Fetch Product')),
           FlatButton(onPressed: loadPhotos, child: Text('Fetch Photos')),
           FlatButton(onPressed: loadUsers, child: Text('Fetch Users'))
        ],
      ),
    );
  }
}
