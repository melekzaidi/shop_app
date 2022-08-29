import 'package:flutter/material.dart';
import 'package:shop_app/provider/products.dart';
import 'package:shop_app/widgets/productItem.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';

class Productsgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final products = productsdata.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (BuildContext c) => products[i],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: productitem(
              /*  products[i].id, products[i].title, products[i].imageurl*/),
        ),
      ),
      itemCount: products.length,
    );
  }
}
