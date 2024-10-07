import 'package:flutter/material.dart';
import 'package:food_ape/screens/cart.dart';
import 'package:food_ape/screens/favFood.dart';
import 'package:food_ape/screens/home.dart';
import 'package:food_ape/screens/home_content.dart';
import 'package:food_ape/screens/login.dart';
import 'package:food_ape/screens/messMenu.dart';
import 'package:food_ape/screens/profile.dart';
import 'package:food_ape/screens/signup.dart';

// Implement the routes for all the pages

var appRoutes = {
  '/': (context) => const Home(),
  '/home': (context) =>  HomePage(),
  '/login': (context) => LoginPage(),
  '/profile': (context) =>  ProfileScreen(),
  '/signup': (context) =>  SignUpPage(),
  '/messMenu': (context) =>  MessMenuPage(),
  '/cart': (context) =>  CartPage(),
  '/favFood': (context) =>  FavFoodPage(),  
  
};