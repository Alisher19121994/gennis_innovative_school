import 'package:flutter/material.dart';
import '../../controller/profile_page.dart';
/*
* Widget topBarDetails() is involved in that the photo Profile, which photo is able to reset or change,
* name & lastName, as well as name of job
* */
Widget topBarDetails(ProfileController profileController){
  return Container(
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
                  // child:CachedNetworkImage(
                  //   imageUrl: "",
                  //   placeholder: (context, url) => CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                ),

                const SizedBox(
                  height: 13,
                ),
                //#name & lastName
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profileController.userProfile.user?.info?.name?.value ?? "",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      profileController.userProfile.user?.info?.surname?.value ?? "",
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
                  profileController.userProfile.user?.typeRole ?? "",
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
  );
}