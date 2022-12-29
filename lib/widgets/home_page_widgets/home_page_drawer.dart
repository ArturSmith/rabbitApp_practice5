import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  HomePageDrawer({super.key, required this.backgroundColor});
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(60)),
              height: 120,
              width: 120,
              child: const Icon(
                Icons.cruelty_free,
                size: 100,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const ListTile(
          leading: Icon(Icons.home),
          title: Text("Rabbit home"),
          trailing: Icon(Icons.arrow_forward),
        ),
        const ListTile(
          leading: Icon(Icons.image),
          title: Text("Rabbit images"),
          trailing: Icon(Icons.arrow_forward),
        ),
        const ListTile(
          leading: Icon(Icons.person),
          title: Text("Rabbit profile"),
          trailing: Icon(Icons.arrow_forward),
        ),
        const SizedBox(
          height: 270,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (() {
                final navigator = Navigator.of(context);
                navigator.pushReplacementNamed("/LoginPage");
              }),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                elevation: MaterialStateProperty.all(25),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 35)),
              ),
              child: const Text('Exit'),
            ),
            ElevatedButton(
              onPressed: (() {}),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                elevation: MaterialStateProperty.all(25),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 35)),
              ),
              child: const Text('Registration'),
            ),
          ],
        )
      ]),
    );
  }
}
