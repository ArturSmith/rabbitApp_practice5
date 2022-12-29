import 'package:flutter/material.dart';
import 'package:flutter_practice5/supporting_elements/app_colors.dart';
import 'home_page_bottom_navigation_bar.dart';
import 'home_page_drawer.dart';
import 'home_page_end_drawer.dart';
import 'home_page_floating_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<Color> enviromentColors = [
    AppColors.mainLightGreenColor,
    Colors.black,
    Colors.blue,
    Colors.red,
  ];

  final List<String> namesOfRabiit = ["Green", 'Black', 'Blue', 'Red'];

  void _changeSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final enviromentColor = enviromentColors[selectedIndex];
    return SafeArea(
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          elevation: 30,
          backgroundColor: enviromentColor,
          title: Text('${namesOfRabiit[selectedIndex]} Rabbit'),
          centerTitle: true,
        ),
        floatingActionButton:
            HomePageFloatingButton(enviromentColor: enviromentColor),
        drawer: HomePageDrawer(backgroundColor: enviromentColor),
        bottomNavigationBar: HomePageBottomNabigationBar(
          enviromentColor: enviromentColor,
          selectedIndex: selectedIndex,
          onTapFunction: _changeSelectedIndex,
        ),
        endDrawer: const HomePageEndDrawer(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "What rabbit are you today",
              style: TextStyle(color: enviromentColor, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Icon(Icons.cruelty_free, size: 200, color: enviromentColor),
          ]),
        ),
      ),
    );
  }
}
