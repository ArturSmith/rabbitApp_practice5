import 'package:flutter/material.dart';
import 'package:flutter_practice5/supportingElements/appColors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<Color> enviromentColors = [
    MyColors.mainLightGreenColor,
    Colors.black,
    Colors.blue,
    Colors.red,
  ];

  List<String> namesOfRabiit = ["Green", 'Black', 'Blue', 'Red'];

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
            myFloatingButton(enviromentColor: enviromentColor),
        drawer: MyDrawer(bacgraundColor: enviromentColor),
        bottomNavigationBar: myBottomNabigationBar(
          enviromentColor: enviromentColor,
          selectedIndex: selectedIndex,
          onTapFunction: _changeSelectedIndex,
        ),
        endDrawer: const MyEndDrawer(),
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

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key, required this.bacgraundColor});
  var bacgraundColor;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: bacgraundColor,
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
                backgroundColor: MaterialStateProperty.all(bacgraundColor),
                elevation: MaterialStateProperty.all(25),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 35)),
              ),
              child: const Text('Exit'),
            ),
            ElevatedButton(
              onPressed: (() {}),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(bacgraundColor),
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

class MyEndDrawer extends StatelessWidget {
  const MyEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          width: 300,
          height: double.infinity,
          color: Colors.white,
          child: Image.asset(
            'lib/assets/images/free-icon-bunny-1468950.png',
            color: Colors.red,
          )),
    );
  }
}

class myFloatingButton extends StatelessWidget {
  const myFloatingButton({super.key, this.enviromentColor});
  // ignore: prefer_typing_uninitialized_variables
  final enviromentColor;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                  color: enviromentColor,
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("I am not going to share with you",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          'lib/assets/images/free-icon-bunny-1468993.png',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ));
            });
      },
      backgroundColor: enviromentColor,
      elevation: 30,
      child: const Icon(Icons.cruelty_free),
    );
  }
}

class myBottomNabigationBar extends StatelessWidget {
  myBottomNabigationBar(
      {super.key,
      this.enviromentColor,
      this.selectedIndex,
      required this.onTapFunction});
  final enviromentColor;
  final selectedIndex;
  Function(int) onTapFunction;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            backgroundColor: enviromentColor,
            label: 'Green rabbit',
            icon: const Icon(Icons.cruelty_free,
                color: MyColors.mainLightGreenColor)),
        BottomNavigationBarItem(
            backgroundColor: enviromentColor,
            label: 'Black rabbit',
            icon: const Icon(Icons.cruelty_free, color: Colors.black)),
        BottomNavigationBarItem(
            backgroundColor: enviromentColor,
            label: 'Blue rabbit',
            icon: const Icon(Icons.cruelty_free, color: Colors.blue)),
        BottomNavigationBarItem(
            backgroundColor: enviromentColor,
            label: 'Red rabbit',
            icon: const Icon(Icons.cruelty_free, color: Colors.red)),
      ],
      currentIndex: selectedIndex,
      onTap: onTapFunction,
    );
  }
}
