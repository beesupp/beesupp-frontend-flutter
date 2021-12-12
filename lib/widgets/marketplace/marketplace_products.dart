import 'package:beesupp_frontend_flutter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketPlaceProducts extends StatelessWidget {
  final List<Product> products;
  MarketPlaceProducts({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 100.0;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: products.length,
      itemBuilder: (BuildContext ctx, index) {
        return Card(
          color: Colors.transparent,
          elevation: 5,
          child: Column(
            children: <Widget>[
              Expanded(
                //child: products[index].image,
                child: Text("asdasdsa"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                products[index].title,
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
                  onPressed: () {},
                  child: Text("Satın Al"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
