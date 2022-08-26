import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/menu_drawer.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

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
        actions: [
          IconButton(
            onPressed: () async {
              if (_imageFile != null) {
                //convert jpg to base64
                final bytesImage = await File(_imageFile!.path).readAsBytes();
                var base64Image = base64Encode(bytesImage);

                //upload to server
                var url =
                    Uri.parse('https://api.codingthailand.com/api/upload');
                var response = await http.post(
                  url,
                  headers: {'Content-Type': 'application/json'},
                  body: json.encode(
                    {
                      'picture': 'data:image/jpeg;base64,$base64Image',
                    },
                  ),
                );
                if (response.statusCode == 200) {
                  var responseMessage = json.decode(response.body);
                  Get.snackbar(
                    '${responseMessage['data']['message']}',
                    '${responseMessage['data']['url']}',
                    backgroundColor: Colors.greenAccent,
                  );

                  setState(() {
                    _imageFile = null;
                  });
                }
              }
            },
            icon: const Icon(
              Icons.upload_file,
            ),
          )
        ],
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
