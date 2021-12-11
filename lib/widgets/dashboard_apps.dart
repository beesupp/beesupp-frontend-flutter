import 'package:beesupp_frontend_flutter/widgets/dashboard_app.dart';
import 'package:flutter/material.dart';

class DashboardApps extends StatelessWidget {
  DashboardApps({Key? key}) : super(key: key);

  final List<Map> myApps = [
    {
      "name": "Settings",
      "image": Image.asset('settings.png'),
      "routeName": "/settings"
    },
    {
      "name": "Telefon",
      "image": Image.asset('phone.png'),
      "routeName": "phone"
    },
    {
      "name": "Navigasyon",
      "image": Image.asset('navigation.png'),
      "routeName": "navigation"
    },
    {"name": "Müzik", "image": Image.asset('music.png'), "routeName": "/sound"},
    {
      "name": "Marketplace",
      "image": Image.asset('marketplace.png'),
      "routeName": "/marketplace"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 100.0;
    return GridView.builder(
        padding: const EdgeInsets.only(left: 30, bottom: 50),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: _crossAxisSpacing,
          mainAxisSpacing: 20,
        ),
        itemCount: myApps.length,
        itemBuilder: (BuildContext ctx, index) {
          return DashboardApp(
            name: myApps[index]['name'],
            image: myApps[index]['image'],
            routeName: myApps[index]['routeName'],
          );
        });
  }
}
