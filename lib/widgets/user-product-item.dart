import 'package:flutter/material.dart';
import 'package:flutter_shop/screens/edit-product.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem({this.id, this.title, this.imageUrl});

  void _navigateToEditProduct(BuildContext context) {
    Navigator.of(context).pushNamed(EditProduct.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: ListTile(

              leading: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl)
              ),
               title: Text(title),
              trailing: Container(
                width: 100,
                child: Row(children: <Widget>[
                  IconButton(icon: Icon(Icons.edit), onPressed: () { _navigateToEditProduct(context); }),
                  IconButton(icon: Icon(Icons.delete), onPressed: null)
                ],)
              ),
            ),
      ),
    );
    
  }
}
