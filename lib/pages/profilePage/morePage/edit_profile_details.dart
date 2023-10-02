import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/profile_changable_details.dart';
import '../../../controller/profile_page.dart';
import '../../../widget_views/profile/editData/profile_details_post.dart';
import 'model/profile_details_post.dart';

class EditProfileDetails extends StatefulWidget {
  static const String id = "editProfileDetails";
  const EditProfileDetails({super.key});
  @override
  State<EditProfileDetails> createState() => _EditProfileDetailsState();
}
class _EditProfileDetailsState extends State<EditProfileDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ProfileDetailsController>(
        init: ProfileDetailsController(),
        builder: (controller){
          return profileDetailsPost(controller,context);
        },
      )
    );
  }
}
