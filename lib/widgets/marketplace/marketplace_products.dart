import 'dart:convert';

import 'package:beesupp_frontend_flutter/constants/constants.dart';
import 'package:beesupp_frontend_flutter/models/product.dart';
import 'package:beesupp_frontend_flutter/utilities/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MarketPlaceProducts extends StatefulWidget {
  final List<Product> products;
  MarketPlaceProducts({Key? key, required this.products, required this.text})
      : super(key: key);
  final String text;

  @override
  State<MarketPlaceProducts> createState() => _MarketPlaceProductsState();
}

class _MarketPlaceProductsState extends State<MarketPlaceProducts> {
  Future<void> saveData(int id) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("product_id", id);
  }

  Future<dynamic>? _futureBool;

  Future<dynamic> buyProduct(String title) async {
    final response = await http.post(
      Uri.parse(ConstantLinks.buyProduct),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: Text("Good Products"),
              content: Text("Congratulations"),
            );
          });
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 100.0;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: widget.products.length,
      itemBuilder: (BuildContext ctx, index) {
        return InkWell(
          onTap: () {},
          child: Card(
            color: Colors.transparent,
            elevation: 5,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Image(
                      image: AssetImage(widget.products[index].image_path)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.products[index].title,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextButton(
                    onPressed: () {
                      if (widget.text == "Uygula") {
                        ThemeSetting.theme_image =
                            widget.products[index].image_path;
                      } else {
                        buyProduct(widget.products[index].title);
                      }
                    },
                    child: Text(widget.text),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
