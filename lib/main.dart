import 'package:flutter/material.dart';
import 'package:flutter3x_nt/pages/about_page.dart';
import 'package:flutter3x_nt/pages/details_page.dart';
import 'package:flutter3x_nt/pages/home_page.dart';
import 'package:flutter3x_nt/pages/layout_design.dart';
import 'package:flutter3x_nt/pages/login_page.dart';
import 'package:flutter3x_nt/pages/news_page.dart';
import 'package:flutter3x_nt/pages/product_page.dart';
import 'package:flutter3x_nt/pages/website_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      // home: const HomePage(),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => const LoginPage(),
            transition: Transition.noTransition),
        GetPage(
            name: '/home',
            page: () => const HomePage(),
            transition: Transition.noTransition),
        GetPage(
            name: '/about',
            page: () => const AboutPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/layout',
            page: () => const LayoutDesign(),
            transition: Transition.circularReveal),
        GetPage(
            name: '/product',
            page: () => const ProductPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/details',
            page: () => const DetailsPage(),
            transition: Transition.downToUp),
        GetPage(
            name: '/news',
            page: () => const NewsPage(),
            transition: Transition.cupertino),
        GetPage(
            name: '/website',
            page: () => const WebsitePage(),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            transition: Transition.cupertinoDialog),
      ],
    );
  }
}
