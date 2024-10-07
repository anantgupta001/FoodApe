import 'package:flutter/material.dart';

class BlockScreen extends StatefulWidget {
  final String? name; 

  const BlockScreen({Key? key, this.name}) : super(key: key);

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.name ?? 'No name provided'), 
      ),
    );
  }
}
