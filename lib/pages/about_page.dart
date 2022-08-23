import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('About Me'),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          OutlinedButton(
            onPressed: (() => {}),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.yellow.shade300),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.person,
                  size: 50,
                ),
                Text('เกี่ยวกับเรา'),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: (() => {}),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.yellow.shade300),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.book_online,
                  size: 50,
                ),
                Text('[ผลงานของเรา]'),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: (() => {}),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.yellow.shade300),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.people,
                  size: 50,
                ),
                Text('บุคลากร'),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: (() => {}),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.yellow.shade300),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.map,
                  size: 50,
                ),
                Text('ติดต่อเรา'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
