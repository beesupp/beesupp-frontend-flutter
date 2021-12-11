import 'package:beesupp_frontend_flutter/widgets/dashboard_appbar.dart';
import 'package:beesupp_frontend_flutter/widgets/dashboard_apps.dart';
import "package:flutter/material.dart";

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }

  double displayHeight(BuildContext context) {
    debugPrint('Height = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }

  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Column(
          children: [
            DashboardAppBar(),
            DashboardApps(),
          ],
        ),
      ),
    );
  }
}
