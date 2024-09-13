import 'package:flutter/material.dart';

import '../Style/Colors.dart';
import 'bottomNavigationScreens/Home.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  colors color = colors();
  int _selectedIndex = 0;
  List _widgetOptions = [
    HomeScreen(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('favorite  Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(IconData icon, int index) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          icon,
          color: _selectedIndex == index ? Colors.black : colors.iconColor,
        ),
        if (_selectedIndex == index)
          Positioned(
            bottom: -10,
            child: Transform.translate(

              offset: const Offset(10, 0), // Move the red dot below the icon
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 5, // Set width to 5
                  height: 5, // Set height to 5
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        elevation: 0,
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: colors.iconColor,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        enableFeedback: false,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: _buildIcon(Icons.home, 0),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: _buildIcon(Icons.access_time, 1),
          ),
          BottomNavigationBarItem(
              label: '', icon: _buildIcon(Icons.favorite_border, 2)),
          BottomNavigationBarItem(
            label: '',
            icon: _buildIcon(Icons.person_outline, 3),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
