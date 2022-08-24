import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/menu_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Map<String, dynamic> product = {};
  Map<String, dynamic> detail = {};
  Future<Map<String, dynamic>>? getDataFuture;

  Future<Map<String, dynamic>> getDatafromAPI(int id) async {
    var response = await http.get(
      Uri.parse('https://api.codingthailand.com/api/course/$id'),
    );
    if (response.statusCode == 200) {
      detail = json.decode(response.body);
      return detail;
    } else {
      throw Exception('Found error from APIs connection.!!');
    }
    //print(response.body);
  }

  @override
  void initState() {
    super.initState();
    product = Get.arguments;
    getDataFuture = getDatafromAPI(product['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('${product['title']}'),
      ),
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: getDataFuture,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                        onTap: () {
                          Get.toNamed('/details', arguments: {
                            'id': snapshot.data!['data'][index]['id'],
                            'title': snapshot.data!['data'][index]['title'],
                          });
                        },
                        leading: Text('${index + 1}'),
                        title: Text(
                            '${snapshot.data!['data'][index]['ch_title']}'),
                        subtitle: Text(
                            '${snapshot.data!['data'][index]['ch_dateadd']}'),
                        trailing: Chip(
                          label: Text(
                              '${snapshot.data!['data'][index]['ch_view']}'),
                        ));
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
