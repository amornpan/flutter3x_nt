import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Product Details Page API'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              Text(
                'Product Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}