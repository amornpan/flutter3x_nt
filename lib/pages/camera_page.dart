import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/menu_drawer.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final ImagePicker _picker = ImagePicker();

  XFile? _imageFile;

  Future<void> takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = photo;
    });
  }

  Widget previewImage() {
    if (_imageFile != null) {
      return Center(
        child: Image.file(
          File(_imageFile!.path),
          fit: BoxFit.fill,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      );
    } else {
      //CircularProgressIndicator()
      return const Center(
        child: Text('กรุณากดปุ่มด่านล่างเพื่อถ่ายรูป'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('Camera Page'),
      ),
      body: previewImage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          takePhoto();
        },
        tooltip: 'ถ่ายรูป',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
