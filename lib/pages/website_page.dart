import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebsitePage extends StatefulWidget {
  const WebsitePage({super.key});

  @override
  State<WebsitePage> createState() => _WebsitePageState();
}

class _WebsitePageState extends State<WebsitePage> {
  Map<String, dynamic> news = {};

  @override
  void initState() {
    //initS
    super.initState();
    news = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข่าวจาก: ${news['name']}'),
      ),
      body: const Text('Website page body'),
    );
  }
}
