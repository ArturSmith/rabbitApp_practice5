import 'package:flutter/material.dart';

class HomePageEndDrawer extends StatelessWidget {
  const HomePageEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          width: 300,
          height: double.infinity,
          color: Colors.white,
          child: Image.asset(
            'assets/images/free-icon-bunny-1468950.png',
            color: Colors.red,
          )),
    );
  }
}
