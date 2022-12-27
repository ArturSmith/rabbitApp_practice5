import 'package:flutter/material.dart';
import 'package:flutter_practice5/Widgets/home_page.dart';
import 'package:flutter_practice5/Widgets/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      title: "Skillbox practice №5",
      routes: {
        '/LoginPage': (context) => const LoginPage(),
        '/HomePage': (context) => const HomePage(),
      },
      initialRoute: "/LoginPage",
    );
  }
}
