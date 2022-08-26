import 'package:flutter/material.dart';
import 'package:flutter3x_nt/state/profile_controller.dart';
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

          // UserAccountsDrawerHeader(
          //   currentAccountPicture: const CircleAvatar(
          //     backgroundImage: AssetImage('assets/images/me.jpg'),
          //   ),
          //   accountName: const Text('Amornpan'),
          //   accountEmail: const Text('amornpan@nt.ntplc.co.th'),
          //   onDetailsPressed: () => {
          //     // print('### Press detail'),
          //     Get.toNamed('/home'),
          //     Scaffold.of(context).closeDrawer(),
          //   },
          // ),

          // GetX<ProfileController>(
          //   init: ProfileController(),
          //   builder: ((controller) => {
          //     return
          //   }),),

          GetX<ProfileController>(
            init: ProfileController(),
            builder: (controller) {
              return UserAccountsDrawerHeader(
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/me.jpg'),
                ),
                accountName:  Text('ยินดีต้อนรับ ${controller.profile['name']}'),
                //accountEmail: const Text('amornpan@nt.ntplc.co.th'),
                accountEmail: Text('อีเมล ${controller.profile['email']}'),
                onDetailsPressed: () => {
                  // print('### Press detail'),
                  Get.toNamed('/home'),
                  Scaffold.of(context).closeDrawer(),
                },
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('หน้าหลัก'),
            onTap: () => {
              Get.offNamedUntil('/home', (route) => false),
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
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: const Text('ข่าวสาร'),
            onTap: () => {
              Get.toNamed(
                '/news',
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('แผนที่'),
            onTap: () => {
              Get.toNamed(
                '/map',
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('เปิดใช้งานกล้อง'),
            onTap: () => {
              Get.toNamed(
                '/camera',
              ),
            },
          ),
        ],
      ),
    );
  }
}
