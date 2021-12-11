import 'package:beesupp_frontend_flutter/utilities/device_properties.dart';
import 'package:beesupp_frontend_flutter/widgets/dashboard_apps.dart';
import "package:flutter/material.dart";

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: DeviceProperties.displayWidth(context),
        height: DeviceProperties.displayHeight(context),
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: DashboardApps(),
      ),
    );
  }
}
