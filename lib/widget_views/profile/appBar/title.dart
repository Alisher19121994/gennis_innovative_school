import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/network/sharedPreferenceData/shared_preference_data.dart';
import '../../../controller/entrance_list.dart';
import '../../../pages/entrancePage/model/group_info.dart';
import '../../../pages/profilePage/main_profile_page.dart';
import '../../../projectImages/projectImages.dart';
Widget titleOfAppBar(BuildContext context,EntranceController controller){
  return Row(
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
          height: 53,
          width: 53,
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xFFE1E8ED),
              border: Border.all(width: 1.0,color: Colors.black)
          ),
          child:CircleAvatar(
            backgroundColor: const Color(0xFFE1E8ED),
            radius: 50,
            backgroundImage: NetworkImage('https://gennis.uz/${controller.userProfile.user?.photoProfile}'),
          ),
        ),
      )
    ],
  );
}