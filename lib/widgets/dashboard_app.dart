import 'package:flutter/material.dart';

class DashboardApp extends StatelessWidget {
  final String name;
  final Image image;
  DashboardApp({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Expanded(
            child: image,
          ),
          Text(name),
        ],
      ),
    );
  }
}
