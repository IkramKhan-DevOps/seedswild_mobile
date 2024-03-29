import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/services/cart/cart_screen.dart';
import 'package:seedswild/services/home/home_screen.dart';
import 'package:seedswild/services/plants/plants_list_screen.dart';
import 'package:seedswild/services/products/products_screen.dart';
import 'package:seedswild/services/settings/settings_screen.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ProductsScreen(),
    CartScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xfff7f6fb),
        selectedItemColor: ColorConstant.mainGreenColor,
        unselectedItemColor: ColorConstant.gray500,
        mouseCursor: MaterialStateMouseCursor.clickable,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Setting',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
