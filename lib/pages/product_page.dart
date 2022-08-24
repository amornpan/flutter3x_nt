import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: dataProductFromFuture,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              // return Center(
              //   child: Text(
              //       'All courses are ${snapshot.data!['data'].length}'),
              // );
              // return Center(
              //   child: Text(
              //       'First course is ${snapshot.data!['data'][0]['title']}'),
              // );
              return ListView.separated(
                  itemBuilder: (context, index) {
                    // return Text(
                    //     '${snapshot.data!['data'][index]['title']}');
                    return ListTile(
                      onTap: () {
                        Get.toNamed('/details', arguments: {
                          'id': snapshot.data!['data'][index]['id'],
                          'title': snapshot.data!['data'][index]['title'],
                        });
                      },
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 80,
                          maxHeight: 80,
                          minWidth: 80,
                          minHeight: 80,
                        ),
                        child: Image.network(
                            '${snapshot.data!['data'][index]['picture']}'),
                      ),
                      // leading:
                      //     Text('${snapshot.data!['data'][index]['id']}'),
                      title: Text('${snapshot.data!['data'][index]['title']}'),
                      subtitle:
                          Text('${snapshot.data!['data'][index]['detail']}'),
                      trailing:
                          Text('${snapshot.data!['data'][index]['view']}'),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: snapshot.data!['data'].length);
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
      ),
    );
  }
}
