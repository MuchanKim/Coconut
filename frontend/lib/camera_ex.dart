import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CameraExample extends StatefulWidget {
  const CameraExample({Key? key}) : super(key: key);

  @override
  _CameraExampleState createState() => _CameraExampleState();
}

class _CameraExampleState extends State<CameraExample> {
  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      backgroundColor: const Color(0xfff4f3f9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100.0),  // Move the buttons a bit down
          Center(
            child: Image.asset(
              'assets/logo.png',  // Replace with your logo asset path
              width: 100.0,
              height: 100.0,
            ),
          ),
          SizedBox(height: 50.0),  // Add some space between logo and buttons
          ElevatedButton(
            onPressed: () {
              getImage(ImageSource.camera);
            },
            child: Text('사진 촬영'),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              getImage(ImageSource.gallery);
            },
            child: Text('갤러리 열기'),
          ),
        ],
      ),
    );
  }
}
