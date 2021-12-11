import 'package:beesupp_frontend_flutter/utilities/device_properties.dart';
import 'package:beesupp_frontend_flutter/widgets/dashboard_app.dart';
import 'package:flutter/material.dart';

class DashboardApps extends StatelessWidget {
  DashboardApps({Key? key}) : super(key: key);

  final List<Map> myApps = [
    {"name": "Settings", "image": Image.asset('settings.png')},
    {"name": "Telefon", "image": Image.asset('phone.png')},
    {"name": "Navigasyon", "image": Image.asset('navigation.png')},
    {"name": "Müzik", "image": Image.asset('music.png')},
    {"name": "Marketplace", "image": Image.asset('marketplace.png')},
  ];

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 100.0;
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: _crossAxisSpacing,
          mainAxisSpacing: 20,
        ),
        itemCount: myApps.length,
        itemBuilder: (BuildContext ctx, index) {
          return DashboardApp(
              name: myApps[index]['name'], image: myApps[index]['image']);
        });
  }
}
