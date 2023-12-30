import 'package:flutter/material.dart';
import 'package:marshudi_12s34/Home.dart';
import 'package:marshudi_12s34/Register.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _index =
      0; // TODO: make sure this is outside build(), otherwise every setState will change the value back to 0

  final screens=[
    Home(),
    Register()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Shop'),
      ),
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tappedItemIndex) => setState(() {
          _index = tappedItemIndex;
        }),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: ('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: ('Register'))
        ],
      ),
    );
  }
}
