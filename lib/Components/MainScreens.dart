import 'package:flutter/material.dart';

import '../MainScreens/Cart/CartScreen.dart';
import '../MainScreens/Categories/CategoriesScreen.dart';
import '../MainScreens/Favorite/FavScreen.dart';
import '../MainScreens/HomeScreen.dart';
import '../MainScreens/Profile/ProfileScreen.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _NavbarState();
}

class _NavbarState extends State<MainScreens> {
  int currentIndex = 0;

  List<Widget> getScreens() {
    return [
      HomeScreen(),
      CategoriesScreen(),
      FavoritesScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreens()[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
