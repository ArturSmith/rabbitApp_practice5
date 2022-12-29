import 'package:flutter/material.dart';
import 'package:flutter_practice5/supporting_elements/app_colors.dart';

class HomePageBottomNabigationBar extends StatelessWidget {
  const HomePageBottomNabigationBar(
      {super.key,
      required this.enviromentColor,
      required this.selectedIndex,
      required this.onTapFunction});

  final Color enviromentColor;
  final int selectedIndex;
  final Function(int) onTapFunction;
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            backgroundColor: enviromentColor,
            label: 'Green rabbit',
            icon: const Icon(Icons.cruelty_free,
                color: AppColors.mainLightGreenColor)),
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

