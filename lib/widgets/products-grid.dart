import 'package:flutter/material.dart';
// import '../providers/product.dart';

import 'package:flutter_shop/widgets/product-item.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
     final bool showFavs;

    ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {

 

    final productsInstance = Provider.of<Products>(context);
    final products = showFavs ? productsInstance.favorites : productsInstance.items;

    return GridView.builder(
        itemCount: products.length,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => 
        ChangeNotifierProvider.value( // but whenever we're reusing elements it's preferred to use.value constructor
          value:  products[i],
          child: ProductItem() ,
          )
          
        
        
       
            );
  }
}
