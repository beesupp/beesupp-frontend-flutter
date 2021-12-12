import 'dart:convert';

import 'package:beesupp_frontend_flutter/utilities/image_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final int id;
  final String category;
  final String title;
  final String description;
  final double price;
  //final Image image;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      category: json['category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: double.parse(json['price']),
      //image: Image.memory(base64.decode(json['image'])),
    );
  }

  Product({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    //required this.image,
  });
}
