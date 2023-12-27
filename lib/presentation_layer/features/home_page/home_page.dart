import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/presentation_layer/features/home_page/widgets/home_page_content.dart';
import 'package:annafi_app/presentation_layer/features/my_cart_page/my_cart_page.dart';
import 'package:annafi_app/presentation_layer/features/settings/settings_screen.dart';
import 'package:annafi_app/presentation_layer/features/search_page/search_page.dart';
import 'package:flutter/material.dart';


import '../shop/shop_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    ShopScreen(),
    SearchPage(),
    MyCartPage(),
    SettingsScreen(),

  ];
  onTapSearch(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.searchPage);
  }

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
            icon: Icon(Icons.search),
            label: 'Search',
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
