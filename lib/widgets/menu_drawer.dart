import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: Colors.blueGrey,
          //   ),
          //   child: Text('Welcome: '),
          // ),
          const UserAccountsDrawerHeader(
            currentAccountPicture:  CircleAvatar(
              backgroundImage: AssetImage('assets/images/me.jpg'),
            ),
            accountName:  Text('Amornpan'),
            accountEmail:  Text('amornpan@nt.ntplc.co.th'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('หน้าหลัก'),
            onTap: () => {
              Get.offNamedUntil('/', (route) => false),
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('เกี่ยวกับเรา'),
            onTap: () => {Get.toNamed('/about')},
          ),
          ListTile(
            leading: const Icon(Icons.layers_outlined),
            title: const Text('ออกแบบเลเอาร์ท'),
            onTap: () => {Get.toNamed('/layout')},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('สินค้า'),
            onTap: () => {
              Get.offNamedUntil('/product', (route) => false),
            },
          ),
        ],
      ),
    );
  }
}
