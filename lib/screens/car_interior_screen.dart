import 'package:beesupp_frontend_flutter/models/product.dart';
import 'package:beesupp_frontend_flutter/utilities/device_properties.dart';
import 'package:flutter/material.dart';

class CarInteriorScreen extends StatefulWidget {
  final Product product;
  const CarInteriorScreen({Key? key, required this.product}) : super(key: key);

  @override
  _CarInteriorScreenState createState() => _CarInteriorScreenState();
}

class _CarInteriorScreenState extends State<CarInteriorScreen> {
  @override
  Widget build(BuildContext context) {
    var _width = DeviceProperties.displayWidth(context);
    var _height = DeviceProperties.displayWidth(context);

    String str = "";
    if (widget.product.title == "Default") {
      str = 'assets/default_inside.png';
    } else if (widget.product.title == "Sport") {
      str = 'assets/sport_inside.png';
    } else if (widget.product.title == "Star") {
      str = 'assets/star_inside.png';
    }
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: _width,
          height: _height,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Center(
            child: Image.asset(str),
          ),
        ),
      ),
    );
  }
}
