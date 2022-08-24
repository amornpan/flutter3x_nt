import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget {
  final String title;
  const MyHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome to NT R&D: $title',
      style: const TextStyle(
        
        color: Colors.brown,
      ),
    );
  }
}
