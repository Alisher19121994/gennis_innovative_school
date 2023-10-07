import 'package:flutter/material.dart';
import '../../controller/users_list.dart';
import '../../pages/mainSceen/pages/usersList/model/users.dart';
import 'list_of_users.dart';
Widget listOfGroups(BuildContext context, UserListController controller) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [
                Color(0xFF00C2FF),
                Colors.cyanAccent,
              ],
              stops: [
                0.0,
                1.0
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              tileMode: TileMode.repeated),
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(8.0),
        height: 130,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${controller.userList.data?.information?.eduLang?.name ?? ""}   ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(controller.userList.data?.information?.eduLang?.value ?? "",
                  style: const TextStyle(
                      color: Colors.black, fontSize: 17),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${controller.userList.data?.information?.groupCourseType?.name ?? ""}   ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  controller.userList.data?.information?.groupCourseType
                      ?.value ??
                      "",
                  style: const TextStyle(
                      color: Colors.black, fontSize: 17),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${controller.userList.data?.information?.groupName?.name ?? ""}   ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  controller.userList.data?.information?.groupName
                      ?.value ??
                      "",
                  style: const TextStyle(
                      color: Colors.black, fontSize: 17),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('${controller.userList.data?.information?.studentsLength?.name ??""}   ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  controller.userList.data?.information?.studentsLength
                      ?.value
                      .toString() ??
                      "",
                  style: const TextStyle(
                      color: Colors.black, fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
      Expanded(
        child: Stack(
          children: [
            ListView.builder(
              itemCount: controller.listOfStudents.length,
              itemBuilder: (BuildContext context, int index) {
                StudentsData students = controller.listOfStudents[index];
                return listOfUsers(students, controller,index);
              },
            ),
            controller.isLoading
                ? const Center(child: CircularProgressIndicator(),)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    ],
  );
}
