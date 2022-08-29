import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;

  final String title;
  final String description;
  final double price;
  final String imageurl;
  bool isfavourite;
  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageurl,
      this.isfavourite = false});
}
