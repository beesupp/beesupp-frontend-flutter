import 'dart:convert';
import 'package:beesupp_frontend_flutter/constants/constant_colors.dart';
import 'package:beesupp_frontend_flutter/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:beesupp_frontend_flutter/models/product.dart';
import 'package:beesupp_frontend_flutter/utilities/device_properties.dart';
import 'package:beesupp_frontend_flutter/widgets/marketplace/marketplace_categories.dart';
import 'package:beesupp_frontend_flutter/widgets/marketplace/marketplace_products.dart';

class MarketplaceHomeScreen extends StatefulWidget {
  MarketplaceHomeScreen({Key? key}) : super(key: key);

  @override
  State<MarketplaceHomeScreen> createState() => _MarketplaceHomeScreenState();
}

class _MarketplaceHomeScreenState extends State<MarketplaceHomeScreen> {
  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(ConstantLinks.getProductUrl));

    if (response.statusCode == 200) {
      List<Product> itemlist = [];
      var v = json.decode(response.body)['items'];
      for (var item in v) {
        itemlist.add(Product.fromJson(item));
      }
      return itemlist;
    } else {
      throw Exception('Failed to load campaigns');
    }
  }

  late Future<List<Product>> futureProduct;
  @override
  void initState() {
    super.initState();
    //futureProduct = fetchProducts();
  }

  void add() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = DeviceProperties.displayWidth(context);
    var height = DeviceProperties.displayHeight(context);
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          Navigator.pop(context);
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {}
      },
      child: Scaffold(
          body: Container(
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.1,
                    width: width,
                    child: Row(children: [
                      Container(
                        width: 120,
                        height: 40,
                        margin: EdgeInsets.only(left: 25),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ConstColors.category_backgorund_color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Text(
                          "My Products",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: width * 0.33),
                        alignment: Alignment.center,
                        child: const Text(
                          "Merecedes App",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: height * 0.1,
                    width: width,
                    alignment: Alignment.topCenter,
                    child: MarketPlaceCategories(
                      func: add,
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder<List<Product>>(
                          future: getProducts(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return MarketPlaceProducts(
                                  products: snapshot.data!);
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            // By default, show a loading spinner.
                            return const Center(
                                child: const CircularProgressIndicator());
                          }))
                ],
              ))),
    );
  }
}
