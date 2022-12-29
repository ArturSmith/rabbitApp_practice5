import 'package:flutter/material.dart';
import 'package:flutter_practice5/widgets/home_page_widgets/home_page.dart';
import 'package:flutter_practice5/widgets/login_page_widgets/login_main_page.dart';

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
        '/LoginPage': (context) => const LoginMainPage(),
        '/HomePage': (context) => const HomePage(),
      },
      initialRoute: "/LoginPage",
    );
  }
}
