import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';
import 'package:get/get.dart';
import '../../controller/entrance_list.dart';
import '../../controller/profile_page.dart';
import '../../widget_views/profile/appBar/title.dart';
import 'morePage/edit_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String id = "profilePage";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var e = Get.find<EntranceController>();
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
          title: const Text('Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),
          actions: <Widget>[
            PopupMenuButton(
              offset: const Offset(0, 40),
              elevation: 2,
              iconSize: 22,
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<int>(
                  height: 50,
                  value: 3,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const EditData()));
                      },
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.edit,
                            size: 17,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          // Optional spacing between icon and text
                          Text(
                            'Edit profile',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PopupMenuItem<int>(
                  height: 50,
                  value: 3,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: InkWell(
                      onTap: (){
                        Get.find<ProfileController>().logout();
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignIn()));
                      },
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.logout, size: 17, color: Colors.black,),
                          SizedBox(width: 5),
                          // Optional spacing between icon and text
                          Text('Log out', style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        body: GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) {
            return Stack(
              children: [
                Column(
                  children: [
                    //#appBar items,photo,fullName
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //#Reset photo & fullName
                          Container(
                            color: const Color(0xFF1DA1F2),
                            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //#photo changes
                                CircleAvatar(
                                  backgroundColor: const Color(0xFFE1E8ED),
                                  radius: 60,
                                //  backgroundImage: NetworkImage('https://gennis.uz/${e.listOfGroups[0].teacherImg}'),
                                  backgroundImage: NetworkImage('https://gennis.uz/${controller.userProfile.user?.photoProfile}'),
                                ),
                                const SizedBox(height: 4.0,),
                                ListTile(
                                  title: Text(controller.userProfile.user?.typeRole ?? "",
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), overflow: TextOverflow.ellipsis,),
                                  subtitle: ListTile(
                                    title:Text(controller.userProfile.user?.info?.surname?.value ?? "", style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18), overflow: TextOverflow.ellipsis),
                                    subtitle: Text(controller.userProfile.user?.info?.name?.value ?? "", style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18), overflow: TextOverflow.ellipsis,),
                                  )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //#teacher details
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                  controller.userProfile.user?.info?.username?.name ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                               const SizedBox(width: 20,),
                               Expanded(
                                 child: Text(
                                      controller.userProfile.user?.info?.username?.value ?? "",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.normal),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                               ),
                              ],
                            ),
                            const Divider(thickness: 1,),
                            const SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(
                                   controller.userProfile.user?.info?.age?.name ?? "",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  child: Text(
                                      controller.userProfile.user?.info?.age?.value
                                              .toString() ??
                                          "",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.normal),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                ),
                              ],
                            ),
                            const Divider(thickness: 1,),
                            const SizedBox(height: 15,),
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
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(width: 20,),
                             Expanded(
                               child: Text(
                                      controller.userProfile.user?.info?.birthDate
                                              ?.value ??
                                          "",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.normal),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                             ),
                              ],
                            ),
                            const Divider(thickness: 1,),
                            const SizedBox(height: 15,),
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
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(width: 20,),
                               Expanded(
                                 child: Text(
                                      controller.userProfile.user?.info?.phone
                                              ?.value ??
                                          "",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.normal),
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                  ],
                ),
                controller.isLoading
                    ? const Center(child: CircularProgressIndicator(),)
                    : const SizedBox.shrink(),
              ],
            );
          },
        ));
  }
}
