import 'package:beesupp_frontend_flutter/widgets/dashboard_appbar.dart';
import 'package:beesupp_frontend_flutter/widgets/dashboard_apps.dart';
import "package:flutter/material.dart";

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.red,
        child: Center(
          child: DashboardApps(),
        ),
      ),
    );
  }
}
