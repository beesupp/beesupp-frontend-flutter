import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          color: Colors.blue,
          child: Center(
            child: Text("MERCEDES BENZ"),
          ),
        ),
      ),
    );
  }
}
