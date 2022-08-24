import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../widgets/menu_drawer.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Map<String, dynamic> products = {};
  Future<Map<String, dynamic>>? dataProductFromFuture;

  Future<Map<String, dynamic>> getDatafromAPI() async {
    var response = await http.get(
      Uri.parse('https://api.codingthailand.com/api/course'),
    );
    if (response.statusCode == 200) {
      products = json.decode(response.body);
      return products;
    } else {
      throw Exception('Found error from APIs connection.!!');
    }
    //print(response.body);
  }

  @override
  void initState() {
    super.initState();
    dataProductFromFuture = getDatafromAPI();
  }

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
            children: [
              FutureBuilder<Map<String, dynamic>>(
                future: dataProductFromFuture,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Text(
                          'All courses are ${snapshot.data!['data'].length}'),
                    );
                    // return Center(
                    //   child: Text(
                    //       'First course is ${snapshot.data!['data'][0]['title']}'),
                    // );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Has error ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
