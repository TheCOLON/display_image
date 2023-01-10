import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ImagePicker imagePicker = ImagePicker();
  File? imageFile;

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image as File;
    });
  }

  Future getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image from Gallery'),
      ),
      body: Center(
          child: imageFile == null
              ? const Text('No image to Display')
              : Image.file(imageFile!, fit: BoxFit.cover)),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.photo_album),
      ),
    );
  }
}
