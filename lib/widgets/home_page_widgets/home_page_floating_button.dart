import 'package:flutter/material.dart';

class HomePageFloatingButton extends StatelessWidget {
  const HomePageFloatingButton({super.key, this.enviromentColor});
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
                          'assets/images/free-icon-bunny-1468993.png',
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