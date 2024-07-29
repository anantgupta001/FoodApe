import 'package:flutter/material.dart';


class FavFoodPage extends StatefulWidget {
  const FavFoodPage({super.key});

  @override
  State<FavFoodPage> createState() => _FavFoodPageState();
}

class _FavFoodPageState extends State<FavFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Food'),
      ),
      body: Center(
        child: Text('Favourite Food Page'),
      ),
    );
  }
}