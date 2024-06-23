import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plantique/pages/home_page/home_screen.dart';
import 'package:plantique/pages/settings/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> body = [
    const HomeScreen(),
    const Center(child: Text('Favourites')),
    const Center(child: Text('Bag')),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.bag_2),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting_2),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
