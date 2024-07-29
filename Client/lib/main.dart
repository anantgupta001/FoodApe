import 'package:flutter/material.dart';
import 'package:food_ape/constants/theme.dart';
import 'package:food_ape/screens/login.dart';
// import 'package:provider/provider.dart';
import 'screens/home.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: appTheme,
      home: DefaultTabController(
        length: 4,
        child: LoginPage(),
      ),
    );

  }
}
