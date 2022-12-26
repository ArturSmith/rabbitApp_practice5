import 'package:flutter/material.dart';
import 'package:flutter_practice5/Widgets/supporting_elements.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List<Color> rabbitColors = [
    MyColors.mainColor,
    Colors.black,
    Colors.blue,
    Colors.red,
  ];

  void _changeSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final enviromentColor = rabbitColors[selectedIndex];
    return SafeArea(
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          elevation: 30,
          backgroundColor: enviromentColor,
          title: const Text('Rabbit'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
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
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              'lib/Widgets/assets/icons/free-icon-bunny-1468993.png',
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
        ),
        drawer: MyDrawer(bacgraundColor: enviromentColor),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                backgroundColor: enviromentColor,
                label: 'Green rabbit',
                icon: const Icon(Icons.cruelty_free, color: MyColors.mainColor)),
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
                icon: const Icon(Icons.cruelty_free,
                    color: Colors.red)),
          ],
          currentIndex: selectedIndex,
          onTap: _changeSelectedIndex,
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

// ignore: must_be_immutable
class MyDrawer extends StatefulWidget {
  MyDrawer({super.key, required this.bacgraundColor});
  // ignore: prefer_typing_uninitialized_variables
  var bacgraundColor;

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: widget.bacgraundColor,
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
                backgroundColor:
                    MaterialStateProperty.all(widget.bacgraundColor),
                elevation: MaterialStateProperty.all(25),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 35)),
              ),
              child: const Text('Exit'),
            ),
            ElevatedButton(
              onPressed: (() {}),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(widget.bacgraundColor),
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
            'lib/Widgets/assets/icons/free-icon-bunny-1468950.png',
            color: Colors.red,
          )),
    );
  }
}
