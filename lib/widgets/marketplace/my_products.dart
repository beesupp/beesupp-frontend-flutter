import 'package:beesupp_frontend_flutter/communications/product_communication.dart';
import 'package:beesupp_frontend_flutter/constants/categories.dart';
import 'package:beesupp_frontend_flutter/models/product.dart';
import 'package:beesupp_frontend_flutter/utilities/device_properties.dart';
import 'package:flutter/material.dart';
import 'marketplace_categories.dart';
import 'marketplace_products.dart';

class MyProducts extends StatefulWidget {
  MyProducts({Key? key}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  List<Product> _product_list = [];
  List<Product> _shown_product_list = [];
  String default_category = Categories.themes;

  List<Product> productByCategory(String category) {
    return _product_list.where((i) => i.category == category).toList();
  }

  void setShownProduct(String category) {
    setState(() {
      default_category = category;
      _shown_product_list = productByCategory(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 100.0;
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
          children: [
            Container(
              margin: EdgeInsets.all(25),
              height: height * 0.1,
              width: width,
              alignment: Alignment.topCenter,
              child: MarketPlaceCategories(
                func: setShownProduct,
              ),
            ),
            Expanded(
                child: FutureBuilder<List<Product>>(
                    future: ProductCommunication.getUserProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return MarketPlaceProducts(
                          products: snapshot.data!,
                          text: "Apply",
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const Center(child: CircularProgressIndicator());
                    }))
          ],
        ),
      )),
    );
  }
}
