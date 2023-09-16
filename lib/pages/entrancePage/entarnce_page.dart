import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/entrance_list.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../projectImages/projectImages.dart';
import '../../widget_views/entrance_page/entrance_page.dart';
import '../profilePage/main_profile_page.dart';
import '../profilePage/model/user_profile.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key? key}) : super(key: key);
  static const String id = "entrancePage";

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  UserProfile userProfile = UserProfile();
  var image = SharedPreferenceData.getImageURL();

  @override
  void initState() {
    super.initState();
    Get.find<EntranceController>().apiEntranceOfGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF00C2FF),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: 130,
                child: Image.asset(ProjectImages.topLogo),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProfilePage()));
                },
                child:CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('https://static.independent.co.uk/2023/07/05/11/SEI162890154.jpg?width=1200&height=900&fit=crop'),
                ),
                // child: Container(
                //   height: 60,
                //   width: 60,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(50)
                //   ),
                //   child: CachedNetworkImage(
                //     imageUrl: userProfile.user?.photoProfile??'',
                //     placeholder: (context, url) => const CircularProgressIndicator(),
                //     errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,),
                //   ),
                // ),
              )
            ],
          ),
        ),
        body: GetBuilder<EntranceController>(
          init: EntranceController(),
          builder: (controller) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: controller.listOfGroups.length,
                  itemBuilder: (context, index) {
                    return listOfGroup(context, controller.listOfGroups[index]);
                  },
                ),
                controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox.shrink(),
              ],
            );
          },
        ));
  }
}
