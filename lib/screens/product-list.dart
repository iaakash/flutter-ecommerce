import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/products.dart';
import 'package:flutter_shop/screens/cart.dart';
import 'package:flutter_shop/widgets/app-drawer.dart';
import 'package:flutter_shop/widgets/badge.dart';
import '../widgets/products-grid.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

enum Categories { favorites, all }

class ProductList extends StatefulWidget {
  static const routeName = 'product-list';

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool _showFavorites = false;
  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(_isInit) {
      setState(() {
        _isLoading = true;
      });
      super.didChangeDependencies();
    Provider.of<Products>(context).fetchProducts().then((_){
      setState(() {
        _isLoading = false;
      });
    });
    }
    
    _isLoading = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    // Future<void> _onRefresh(context) async {
    //   await Provider.of<Products>(context).fetchProducts();
    // }

    void _onPopItemSelected(selectedValue) {
      setState(() {
        if (selectedValue == Categories.all) {
          _showFavorites = false;
        } else {
          _showFavorites = true;
        }
      });
    }

    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Shop in Flutter with Providers'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (selectedValue) => _onPopItemSelected(selectedValue),
              itemBuilder: (BuildContext ctx) => <PopupMenuEntry>[
                const PopupMenuItem(
                  value: Categories.favorites,
                  child: Text('Show Favorites'),
                ),
                const PopupMenuItem(
                  value: Categories.all,
                  child: Text('Show All'),
                )
              ],
            ),
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cart.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    CartPage.routeName,
                  );
                },
              ),
            ),
          ],
        ),
        body: ProductsGrid(_showFavorites)
        );
       
  }
}
