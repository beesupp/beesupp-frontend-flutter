import 'package:flutter/material.dart';

class DashboardApps extends StatelessWidget {
  DashboardApps({Key? key}) : super(key: key);

  final List<Map> myApps = [
    {"name": "Settings", "image": Image.asset('settings.png')},
    {"name": "Telefon", "image": Image.asset('phone.png')},
    {"name": "Navigasyon", "image": Image.asset('navigation.png')},
    {"name": "Müzik", "image": Image.asset('music.png')},
    {"name": "Klima", "image": Image.asset('climate.png')},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          color: Colors.red,
          child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: myApps.length,
              itemBuilder: (BuildContext ctx, index) {
                return Card(
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: myApps[index]['image'],
                      ),
                      Text(myApps[index]['name']),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
