import 'dart:io';

import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';

class UserInformationScreen extends StatefulWidget {
  static const routeName = '/user-information-screen';
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final nameController = TextEditingController();
  File? image;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
      children: [
        Stack(
          children: [
            (image == null)
                ? const CircleAvatar(
                    radius: 80,
                    child: Icon(Icons.person, size: 60),
                  )
                : CircleAvatar(
                    backgroundImage: FileImage(image!),
                    radius: 80,
                  ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: selectImage,
                icon: const Icon(Icons.add_a_photo),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: screenSize.width * 0.85,
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Enter your name'),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.done)),
          ],
        )
      ],
    ))));
  }
}
