import 'package:flutter/material.dart';

BottomNavigationBar getBottomNavigationBar (context) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Account',
      ),
    ],
    onTap: (index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/');
        case 1:
          Navigator.pushNamed(context, '/account');
      }
    },
  );
}