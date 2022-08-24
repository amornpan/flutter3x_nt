import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Product Page API'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const[
               Text(
                'Product',
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
