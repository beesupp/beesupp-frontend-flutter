import 'dart:convert';
import 'package:beesupp_frontend_flutter/communications/product_communication.dart';
import 'package:beesupp_frontend_flutter/constants/categories.dart';
import 'package:beesupp_frontend_flutter/constants/constant_colors.dart';
import 'package:beesupp_frontend_flutter/constants/constants.dart';
import 'package:beesupp_frontend_flutter/widgets/marketplace/my_products.dart';
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
  late Future<List<Product>> futureProduct;
  List<Product> _product_list = [];
  List<Product> _shown_product_list = [];
  String default_category = Categories.themes;

  @override
  void initState() {
    super.initState();
  }

  void setShownProduct(String category) {
    setState(() {
      default_category = category;
      _shown_product_list = productByCategory(category: category);
      _product_list = _shown_product_list;
    });
  }

  List<Product> productByCategory({String category = ""}) {
    if (category == "") {
      return _product_list;
    }
    return _product_list.where((i) => i.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    var width = DeviceProperties.displayWidth(context);
    var height = DeviceProperties.displayHeight(context);
    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          Navigator.of(context).pushNamed("/").then((value) {
            print("do stuff");
          });
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProducts()),
                          );
                        },
                        child: Container(
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
                    margin: const EdgeInsets.only(bottom: 20),
                    height: height * 0.1,
                    width: width,
                    alignment: Alignment.topCenter,
                    child: MarketPlaceCategories(
                      func: setShownProduct,
                    ),
                  ),
                  Expanded(
                      child: FutureBuilder<List<Product>>(
                          future: ProductCommunication.getProducts(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              _product_list = snapshot.data!;
                              _shown_product_list =
                                  productByCategory(category: default_category);
                              return MarketPlaceProducts(
                                  text: "Satın Al", products: snapshot.data!);
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            // By default, show a loading spinner.
                            return const Center(
                                child: CircularProgressIndicator());
                          }))
                ],
              ))),
    );
  }
}
