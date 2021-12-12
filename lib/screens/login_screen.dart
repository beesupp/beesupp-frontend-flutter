import 'package:beesupp_frontend_flutter/utilities/device_properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var _width = DeviceProperties.displayWidth(context);
    var _height = DeviceProperties.displayWidth(context);

    return Container(
      width: _width,
      height: _height,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Center(
        child: spinkit,
      ),
    );
  }
}
