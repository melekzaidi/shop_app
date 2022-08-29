import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product.dart';

import '../provider/products.dart';

class productdetailsscreen extends StatelessWidget {
  // final String title;
  static const routename = "productdetails";

  // const productdetailsscreen(this.title);
  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context, listen: false);
    final prodcutid = ModalRoute.of(context)!.settings.arguments as String;
    final Product elemet = productsdata.findbyid(prodcutid);

    final String title = elemet.title.toString();
    return Scaffold(appBar: AppBar(title: Text((elemet.title))));
  }
}
