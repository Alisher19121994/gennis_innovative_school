import 'package:flutter/material.dart';
import '../../controller/entrance_list.dart';
import '../../pages/entrancePage/model/group_info.dart';
import '../../pages/mainSceen/main.dart';
import '../../projectImages/projectImages.dart';

Widget listOfGroup(BuildContext context,EntranceController controller,int index,GroupsInfo groupsInfo) {
  return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  MainPage(setId: groupsInfo.id ?? 0)));
      },
      child:Container(
        margin: const EdgeInsets.all(4.0),
          height: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                  image: NetworkImage('https://gennis.uz/${controller.listOfGroups[index].teacherImg}'),
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
                    controller.listOfGroups[index].teacherName??"",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Text(
                    controller.listOfGroups[index].teacherSurname??"",
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
                    controller.listOfGroups[index].name?? "",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
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
                    controller.listOfGroups[index].subject?? "",
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