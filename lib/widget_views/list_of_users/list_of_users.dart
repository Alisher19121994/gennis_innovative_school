import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';
import '../../controller/users_list.dart';

Widget listOfUsers(StudentsData students,UserListController userListController,int index) {
  String  url = 'https://gennis.uz/${userListController.listOfStudents[index].photoProfile}';
  return Slidable(
    enabled: true,
    direction: Axis.horizontal,
    closeOnScroll: true,
    endActionPane: ActionPane(
      extentRatio: 0.25,
      motion: const ScrollMotion(),
      children: [
        students.money! > 0
            ? SlidableAction(
          onPressed: (BuildContext context) {},
          flex: 3,
          backgroundColor: Colors.green,
          label: students.money.toString(),
          borderRadius: BorderRadius.circular(8),
        )
            : SlidableAction(
          onPressed: (BuildContext context) {},
          flex: 3,
          backgroundColor: Colors.red,
          label: students.money.toString(),
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    ),
      child: Card(
        color: const Color(0xFFE1E8ED),
        child: SizedBox(
          height: 54.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
            Stack(
              children: [
                Row(
                  children: [
                    Container(
                        height: 50.0,
                        width: 50.0,
                        margin: const EdgeInsets.only(left: 8.0,top: 1.0,bottom: 1.0,right: 3.0),
                        child: url.isNotEmpty ?
                        Container(
                          height: 50.0,
                          width: 50.0,
                          margin: const EdgeInsets.only(left: 8.0,top: 1.0,bottom: 1.0,right: 3.0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage('https://gennis.uz/${userListController.listOfStudents[index].photoProfile}')
                              )
                          ),
                        ) :
                        Container(
                          height: 50.0,
                          width: 50.0,
                          margin: const EdgeInsets.all(1.0),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(100.0)),
                              image: DecorationImage(
                                  image: AssetImage(ProjectImages.placeholder)
                              )
                          ),
                        )
                    ),
                    const SizedBox(width: 5.0,),
                    //#surname
                    Text(students.surname??"", style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis),
                    const SizedBox(width: 7.0,),
                    //#name
                    Text(students.name??"", style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                userListController.isLoading
                    ? const Center(child: CircularProgressIndicator(),)
                    : const SizedBox.shrink(),
              ],
            )
            ],
          ),
        ),
      ),
  );
}