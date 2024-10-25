import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stanch/screens/HomePage.dart';
import 'package:stanch/screens/descriptionScreen.dart';

class Initscreen extends StatefulWidget {
  const Initscreen({super.key});

  @override
  State<Initscreen> createState() => _InitscreenState();
}

class _InitscreenState extends State<Initscreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    Homepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_all),
            label: 'Prolet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined),
            label: 'Meetup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste_search_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          )
        ],
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
