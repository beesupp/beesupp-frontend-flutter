import 'package:beesupp_frontend_flutter/models/product.dart';

import 'image_helper.dart';

class JsonParser {
  static List<Product> getListOfProduct(Map<String, dynamic> json) {
    List<Product> products = [];
    for (var item in json.values) {
      products.add(Product(
        id: item['id'],
        category: item['category'],
        title: item['title'],
        description: item['description'],
        price: item['price'],
        image: ImageHelper.imageFromBase64String(item['image']),
      ));
    }
    return products;
  }
}
