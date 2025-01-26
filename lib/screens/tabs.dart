import 'package:flutter/material.dart';
import 'package:untitled/screens/category.dart';
import 'package:untitled/screens/curate.dart';
import 'package:untitled/screens/home.dart';
import 'package:untitled/screens/more.dart';
import 'package:untitled/screens/sale.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();

    if (_selectedPageIndex == 1) {
      activePage = const CategoryScreen();
    }
    if (_selectedPageIndex == 2) {
      activePage = const CurateScreen();
    }
    if (_selectedPageIndex == 3) {
      activePage = const SaleScreen();
    }
    if (_selectedPageIndex == 4) {
      activePage = const MoreScreen();
    }

    return Scaffold(
      body: activePage, 
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Colors.green, // Highlighted color
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brush),
            label: 'Curate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Sale',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
