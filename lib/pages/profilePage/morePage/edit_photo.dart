import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/profile_page.dart';
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
        body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return createImageForProfile(controller);
          },
        ));
  }
}
