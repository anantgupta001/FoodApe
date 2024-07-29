import 'package:flutter/material.dart';
import 'package:food_ape/constants/theme.dart';
import 'package:food_ape/screens/cart.dart';
import 'package:food_ape/screens/favFood.dart';
import 'package:food_ape/screens/messMenu.dart';
import 'package:food_ape/screens/notifi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1; // Set default selected index (home page)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: kPrimaryColor,
        hoverColor: kRustyRed,
        child: const Icon(Icons.food_bank_rounded),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: kPrimaryColor,
        shadowColor: Colors.black,
        color: k2ScaffoldBackgroundColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 2.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: _selectedIndex == 0 ? kPrimaryColor : Colors.black,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.home_filled,
                color: _selectedIndex == 1 ? kPrimaryColor : Colors.black,
              ),
              onPressed: () => _onItemTapped(1),
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: _selectedIndex == 2 ? kPrimaryColor : Colors.black,
              ),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(
                Icons.notification_important_rounded,
                color: _selectedIndex == 3 ? kPrimaryColor : Colors.black,
              ),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          MessMenuPage(),
          Center(child: Text('Home Page')), // Placeholder for home page content
          FavFoodPage(),
          NotificationPage(),
        ],
      ),
    );
  }
}
