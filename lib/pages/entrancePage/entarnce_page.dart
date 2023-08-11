import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/entrance_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: FastCachedImage(
                    url: userProfile.user?.photoProfile ?? '',
                    fadeInDuration: const Duration(seconds: 1),
                    errorBuilder: (context, exception, stacktrace) {
                      return const Text('Error in loading!');
                    },
                    // loadingBuilder: (){
                    //
                    // },
                  ),
                ),
                // child: CircleAvatar(
                //   radius: 24,
                //   //backgroundImage: NetworkImage(userProfile.user?.photoProfile ?? ''),
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
