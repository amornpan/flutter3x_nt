import 'package:flutter/material.dart';
import 'package:flutter3x_nt/widgets/menu_drawer.dart';
import 'package:flutter3x_nt/widgets/my_header.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fullname = 'Mary Doe';

  @override
  void initState() {
    super.initState();
    debugPrint('initState');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        toolbarHeight: 60.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              debugPrint('you click search icon button');
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_outlined),
            tooltip: 'More',
            onPressed: () {
              debugPrint('you click Moure icon button');
            },
          ),
        ],
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyHeader(title: 'Kong1'),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                // Get.toNamed('/about');
                debugPrint('## test');
              },
              child: const Text('About'),
            ),
            OutlinedButton(
              onPressed: () {
                Get.toNamed('/layout');
              },
              child: const Text('Layout'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
