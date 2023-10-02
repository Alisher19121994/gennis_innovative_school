import 'package:flutter/material.dart';
import '../../pages/entrancePage/model/group_info.dart';
import '../../pages/mainSceen/main.dart';
import '../../projectImages/projectImages.dart';

Widget listOfGroup(BuildContext context,GroupsInfo groups) {
  return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  MainPage(setId: groups.id ?? 0)));
      },
      child:Container(
        margin: const EdgeInsets.all(4.0),
          height: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                  image: NetworkImage('https://gennis.uz/${groups.teacherImg}'),
                  fit: BoxFit.cover)
       ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
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
                    groups.teacherName??"",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Text(
                    groups.teacherSurname??"",
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

  );
}