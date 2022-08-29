import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product.dart';
import 'package:shop_app/screens/productdetailsscreen.dart';

class productitem extends StatelessWidget {
/*  final String id;
  final String title;
  final String imageUrl;

  productitem(
    this.id,
    this.title,
    this.imageUrl,
  );*/
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(productdetailsscreen.routename, arguments: product.id);
      },
      child: GridTile(
        child: Image.network(product.imageurl, fit: BoxFit.cover),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.deepOrange,
            ),
            onPressed: () {},
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.deepOrange,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
