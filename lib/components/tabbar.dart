// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'HOME/home.dart';
import 'search.dart';
import 'profile.dart';
import 'settings.dart';

List<GlobalKey<NavigatorState>> navigatorKeys = [
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
];

final List<Widget> views = [const Home(), const Search(), profile(), Setting()];

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: double.infinity,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87.withOpacity(0.9),
        selectedItemColor: const Color(0xff1DB954),
        unselectedItemColor: const Color(0xff333333),
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Your Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: views,
      ),
    );
  }
}
