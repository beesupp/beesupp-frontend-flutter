import 'package:beesupp_frontend_flutter/utilities/device_properties.dart';
import 'package:beesupp_frontend_flutter/utilities/theme_settings.dart';
import 'package:beesupp_frontend_flutter/widgets/dashboard_apps.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

String _theme_image = ThemeSetting.theme_image;

class _DashboardScreenState extends State<DashboardScreen> {
  Future<void> readySharedPreferences() async {
    var sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      // ThemeSetting.product_id = sharedPreferences.getInt("product_id") ?? 0;
      // _theme_image = ThemeSetting.getThemeImage(ThemeSetting.product_id);
    });
  }

  @override
  void initState() {
    super.initState();
    _theme_image = ThemeSetting.theme_image;
    readySharedPreferences();
  }

  Future<void> saveData(int product_id_2) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      // sharedPreferences.setInt("product_id", product_id_2);
      // ThemeSetting.product_id = product_id_2;
      // _theme_image = ThemeSetting.getThemeImage(ThemeSetting.product_id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: DeviceProperties.displayWidth(context),
        height: DeviceProperties.displayHeight(context),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ThemeSetting.theme_image),
            fit: BoxFit.cover,
          ),
        ),
        child: DashboardApps(),
      ),
    );
  }
}
