import 'package:flutter/material.dart';

class LayoutDesign extends StatefulWidget {
  const LayoutDesign({super.key});

  @override
  State<LayoutDesign> createState() => _LayoutDesignState();
}

class _LayoutDesignState extends State<LayoutDesign> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('ออกแบบ Layout'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/building-2.png'),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'R&D National Telecom',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
