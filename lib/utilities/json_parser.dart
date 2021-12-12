import 'package:beesupp_frontend_flutter/models/product.dart';

class JsonParser {
  static List<Product> getListOfProduct(Map<String, dynamic> json) {
    List<Product> products = [];
    for (var item in json.values) {
      products.add(
        Product(
          owner_name: item['owner_name'] as String,
          id: item['id'],
          category: item['category'],
          title: item['title'],
          description: item['description'],
          price: double.parse(item['price']),
          image_path: 'assets/' + item['image'],
        ),
      );
    }
    return products;
  }
}
