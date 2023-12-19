import 'package:flutter/material.dart';
import 'package:musicsl/HomePage.dart';
import 'package:musicsl/colors/colors.dart';
import 'package:musicsl/pages/AccountPage.dart';
import 'package:musicsl/pages/FavoritePage.dart';
import 'package:musicsl/pages/SearchPage.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({super.key});

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int _currentIndex = 0;

  void nextPage(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

    elevation: 10,
  // showUnselectedLabels: true,
   showSelectedLabels: true,
selectedLabelStyle: const TextStyle(
  color: textColor
),
  unselectedLabelStyle: const TextStyle(
    color: whiteColor,
  ),
          currentIndex: _currentIndex,
          onTap: nextPage,
          items: const [
     
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  

                ),
                label: "Home",  ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: "Account")
          ]),
    );
  }
}
