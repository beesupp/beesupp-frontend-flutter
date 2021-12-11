import 'package:beesupp_frontend_flutter/screens/marketplace/marketplace_home_screen.dart';
import 'package:flutter/material.dart';

class DashboardApp extends StatelessWidget {
  final String name;
  final Image image;
  final String routeName;
  DashboardApp(
      {Key? key,
      required this.name,
      required this.image,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MarketplaceHomeScreen()),
          );
        },
        child: Card(
          color: Colors.transparent,
          elevation: 5,
          child: Column(
            children: <Widget>[
              Expanded(
                child: image,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
