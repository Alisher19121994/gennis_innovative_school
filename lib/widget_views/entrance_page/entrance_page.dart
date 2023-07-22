import 'package:flutter/material.dart';

import '../../pages/entrancePage/model/groups_data.dart';
import '../../pages/mainSceen/main.dart';
import '../../projectImages/projectImages.dart';

Widget listOfGroup(BuildContext context,Groups groups) {
  return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  MainPage(setId: groups.id?? 0)));
      },
      title: Card(
        elevation: 0,
        //#image
        child: Container(
          height: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image:  const DecorationImage(
                  image: AssetImage(ProjectImages.book), fit: BoxFit.cover)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.black26
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //#subject
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Text(
                    groups.typeOfCourse??"",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //#title
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Text(
                    groups.subject??"",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
  );
}