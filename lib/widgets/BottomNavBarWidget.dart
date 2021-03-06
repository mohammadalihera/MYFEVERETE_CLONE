import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

int currentIndex = 0;

void navigateToScreens(int index) {
  currentIndex = index;
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        navigateToScreens(index);
      });
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Home',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.shopify),
          title: Text(
            'Products',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.houseUser),
          title: Text(
            'Shops',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.sellsy),
          title: Text(
            'Sale',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          title: Text(
            'Account',
            style: TextStyle(color: Color(0xFF545454)),
          ),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFF3DB0D3),
      onTap: _onItemTapped,
    );
  }
}
