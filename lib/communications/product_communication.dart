import 'dart:convert';

import 'package:beesupp_frontend_flutter/constants/constants.dart';
import 'package:beesupp_frontend_flutter/models/product.dart';
import 'package:http/http.dart' as http;

class ProductCommunication {
  static Future<List<Product>> getProducts() async {
    List<Product> itemlist = [];
    try {
      final response = await http.get(Uri.parse(ConstantLinks.getProductUrl));

      if (response.statusCode == 200) {
        var v = json.decode(response.body)['items'];
        for (var item in v) {
          itemlist.add(Product.fromJson(item));
        }
        return itemlist;
      } else {
        throw Exception('Failed to load campaigns');
      }
    } catch (ex) {
      return itemlist;
    }
  }
}
