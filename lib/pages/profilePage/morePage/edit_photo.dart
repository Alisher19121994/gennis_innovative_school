import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/profile_page.dart';
import '../../../controller/profile_photo.dart';
import '../../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../../widget_views/profile/photo/photo.dart';

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
        body: GetBuilder<ProfilePhotoController>(
          init: ProfilePhotoController(),
          builder: (controller) {
             return createImageForProfile(controller);
          },
        ));
  }
}
