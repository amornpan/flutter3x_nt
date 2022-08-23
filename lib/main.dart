import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NT R&D',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: const Color.fromRGBO(255, 209, 0, 1),
        textTheme: const TextTheme(
          headline4: TextStyle(
            color: Colors.brown,
            fontSize: 20,
          ),
          headline2: TextStyle(
            color: Colors.red,
            fontSize: 40,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
