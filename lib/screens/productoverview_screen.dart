import 'package:flutter/material.dart';
import 'package:shop_app/widgets/productItem.dart';
import 'package:shop_app/screens/productdetailsscreen.dart';

import '../provider/product.dart';
import '../widgets/productgrid.dart';

class Productoverview_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Myshop")),
      body: Productsgrid(),
    );
  }
}
