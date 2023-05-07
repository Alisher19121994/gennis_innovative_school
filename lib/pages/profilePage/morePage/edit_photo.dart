import 'package:flutter/material.dart';

class EditPhoto extends StatefulWidget {
  const EditPhoto({Key? key}) : super(key: key);
  static const String id = "editPhoto";
  @override
  State<EditPhoto> createState() => _EditPhotoState();
}

class _EditPhotoState extends State<EditPhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("EditPhoto"),
      ),
    );
  }
}
