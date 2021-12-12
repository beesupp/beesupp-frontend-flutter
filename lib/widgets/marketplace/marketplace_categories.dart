import 'package:beesupp_frontend_flutter/constants/categories.dart';
import 'package:beesupp_frontend_flutter/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class MarketPlaceCategories extends StatelessWidget {
  final void Function(String) func;
  MarketPlaceCategories({Key? key, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              func(Categories.themes);
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ConstColors.category_backgorund_color,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                Categories.themes,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              func(Categories.features);
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ConstColors.category_backgorund_color,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                Categories.features,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              func(Categories.nfts);
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ConstColors.category_backgorund_color,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                Categories.nfts,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
    // ListView.builder(
    //   shrinkWrap: true,
    //   scrollDirection: Axis.horizontal,
    //   itemCount: categories.length,
    //   itemBuilder: (BuildContext context, int index) => Container(
    //     width: 200,
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //         color: Colors.blue,
    //         border: Border.all(
    //           color: Colors.red,
    //         ),
    //         borderRadius: BorderRadius.all(Radius.circular(20))),
    //     child: Text(
    //       categories[index],
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontSize: 20, color: Colors.white),
    //     ),
    //   ),
    // );
  }
}
