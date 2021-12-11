import 'package:beesupp_frontend_flutter/constants/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class MarketPlaceCategories extends StatelessWidget {
  final Function func;
  MarketPlaceCategories({Key? key, required this.func}) : super(key: key);

  List<String> categories = ["Themes", "Features", "NFTs"];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              func();
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ConstColors.category_backgorund_color,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                categories[0],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ConstColors.category_backgorund_color,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                categories[1],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ConstColors.category_backgorund_color,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                categories[2],
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