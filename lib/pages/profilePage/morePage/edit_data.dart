import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/profile_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'edit_photo.dart';
import 'edit_profile_details.dart';

class EditData extends StatefulWidget {
  const EditData({Key? key}) : super(key: key);
  static const String id = "editPhoto";

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  @override
  void initState() {
    super.initState();
    //Get.find<ProfileController>().getProfileDate();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF00C2FF),
          elevation: 10,
          //#edit data title
            centerTitle: true,
          title: Row(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(width: 75,),
              Text(
                "Edit Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          ),
            bottom: const TabBar(
              physics: ScrollPhysics(),
                isScrollable: true,
                indicatorColor: Colors.white,
                unselectedLabelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                tabs: [
                  Tab(
                    child: Text(
                      "Photo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Details",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]
            )
        ),
        body: const TabBarView(
          children: [
            EditPhoto(),
            EditProfileDetails()
          ],
        ),
      ),
    );
  }
}
