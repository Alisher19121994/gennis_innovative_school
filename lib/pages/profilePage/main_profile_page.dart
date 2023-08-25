import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../controller/profile_page.dart';
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../widget_views/profile/appBar/actions.dart';
import '../../widget_views/profile/appBar/title.dart';
import '../../widget_views/profile/profile.dart';
import '../../widget_views/profile/teacherDeatails.dart';
import 'model/user_profile.dart';
import 'morePage/edit_data.dart';
import 'morePage/edit_photo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String id = "profilePage";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Get.find<ProfileController>().getProfileDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        title: titleOfAppBar(),
        actions: <Widget>[
            PopupMenuButton(offset: const Offset(0, 40), elevation: 2, iconSize: 22, itemBuilder: (BuildContext context) => [
              PopupMenuItem<int>(
        onTap: (){
          Get.to(const EditData());
        },
        value: 1,
        child: Row(
          children: const <Widget>[
            Icon(Icons.edit,size: 17,color: Colors.black,),
            SizedBox(width: 5), // Optional spacing between icon and text
            Text('Data',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
              PopupMenuItem<int>(
        onTap: (){
          Get.to(const EditPhoto());
        },
        value: 2,
        child: Row(
          children: const <Widget>[
            Icon(Icons.photo_camera,size: 17,color: Colors.black,),
            SizedBox(width: 5), // Optional spacing between icon and text
            Text('Photo',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
              PopupMenuItem<int>(
        onTap: (){
          // log out
        },
        value: 3,
        child: Row(
          children: const <Widget>[
            Icon(Icons.logout,size: 17,color: Colors.black,),
            SizedBox(width: 5), // Optional spacing between icon and text
            Text('Log out',style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    ],)
        ],
      ),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller){
          return Column(
            children: [
              //#appBar items,photo,fullName
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                    color: Colors.blue),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //#Reset photo & fullName
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: [
                            //#photo changes
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(50),
                              ),
                              height: 150,
                              width: 150,
                              child:CachedNetworkImage(
                                imageUrl: controller.image.toString(),
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),

                            const SizedBox(
                              height: 13,
                            ),
                            //#name & lastName
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.userProfile.user?.info?.name?.value ?? "",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  controller.userProfile.user?.info?.surname?.value ?? "",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            //#name of job
                            Text(
                              controller.userProfile.user?.typeRole ?? "",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // topBarDetails(controller),
              //#teacher details
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.userProfile.user?.info?.username?.name ?? "", style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),),
                          Text(controller.userProfile.user?.info?.username?.value ?? "", style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.normal),),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.userProfile.user?.info?.age?.name ?? "", style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),),
                          Text(controller.userProfile.user?.info?.age?.value.toString() ?? "", style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.normal),),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userProfile.user?.info?.birthDate?.name ?? "",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            controller.userProfile.user?.info?.birthDate?.value ?? "",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            controller.userProfile.user?.info?.phone?.name ?? "",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            controller.userProfile.user?.info?.phone?.value ?? "",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              )
            //  teacherDetails(controller)
            ],
          );
        },
      )
    );
  }
}
