import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final Image image;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
}
