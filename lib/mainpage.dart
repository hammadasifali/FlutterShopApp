import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'home_page.dart';
import 'product_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = const [
    HomePage(),
    ProductList(),
    CartPage(),
  ];

  late int selectedIcon;

  @override
  void initState() {
    super.initState();
    selectedIcon = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: IndexedStack(
        index: selectedIcon,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.indigo, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0, // Remove default BottomNavigationBar elevation
          iconSize: 30,
          onTap: (value) {
            setState(() {
              selectedIcon = value;
            });
          },
          backgroundColor: Colors.transparent, // Set transparent background
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          currentIndex: selectedIcon,
          items: [
            _buildBottomNavigationBarItem(Icons.home, 'Home'),
            _buildBottomNavigationBarItem(Icons.shopping_bag, 'Products'),
            _buildBottomNavigationBarItem(Icons.shopping_cart, 'Cart'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      label: label,
    );
  }
}
