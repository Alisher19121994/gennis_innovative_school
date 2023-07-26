import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/entrance_list.dart';
import 'package:gennis_innovative_school/pages/profilePage/main_profile_page.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../widget_views/entrance_page/entrance_page.dart';
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
    //_handleRefresh();
    Get.find<EntranceController>().apiEntranceOfGroups();
  }

  _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.find<EntranceController>().useRefreshToken();
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
                  // Navigator.pushNamed(context,ProfilePage.id );
                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProfilePage()));
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ProfilePage()));
                },
                child: CircleAvatar(
                    radius: 24,
                    child: Image.network(userProfile.user?.photoProfile ?? '',)
                ),
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
                // CupertinoRefresh.withScrollbar(
                //   onRefresh: _handleRefresh(),
                //   child: Stack(
                //     children: [
                //       ListView.builder(
                //         itemCount: controller.listOfGroups.length,
                //         itemBuilder: (context, index) {
                //           return listOfGroup(
                //               context, controller.listOfGroups[index]);
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ],
            );
          },
        ));
  }
}
