import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/users_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../widget_views/list_of_users/list_of_users.dart';
import 'model/users.dart';

class UsersList extends StatefulWidget {
  final int ids;
   const UsersList({Key? key, required this.ids,}) : super(key: key);
   static const String id = "usersList";

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  void initState() {
    super.initState();
    Get.find<UserListController>().apiUserListOfStudents(widget.ids);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:GetBuilder<UserListController>(
        init: UserListController(),
        builder: (controller){
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   // #group overall views in the basic schedule
                   //  Container(
                   //    decoration: BoxDecoration(
                   //        borderRadius: BorderRadius.circular(17),
                   //        color: Colors.lightBlueAccent),
                   //    margin: const EdgeInsets.all(6),
                   //    padding: const EdgeInsets.all(16),
                   //    height: 270,
                   //    child: Column(
                   //      children: [
                   //        Row(
                   //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //          children:  [
                   //            Text(
                   //              controller.userList.data?.information?.eduLang?.name??"",
                   //              style: const TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                   //            ),
                   //            Text(
                   //              controller.userList.data?.information?.eduLang?.value??"",
                   //              style: const TextStyle(color: Colors.black, fontSize: 17),
                   //            ),
                   //          ],
                   //        ),
                   //        const SizedBox(
                   //          height: 10,
                   //        ),
                   //        Row(
                   //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //          children:  [
                   //             Text(
                   //            //  "Course type",
                   //              controller.userList.data?.information?.groupCourseType?.name??"" ,
                   //              style: const TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                   //            ),
                   //            Text(
                   //              controller.userList.data?.information?.groupCourseType?.value??"",
                   //              style: const TextStyle(color: Colors.black, fontSize: 17),
                   //            ),
                   //          ],
                   //        ),
                   //        const SizedBox(
                   //          height: 10,
                   //        ),
                   //        Row(
                   //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //          children:  [
                   //            const Text(
                   //              "Group's name",
                   //              style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                   //            ),
                   //            Text(
                   //              controller.userList.data?.information?.groupName?.value??"",
                   //              style: const TextStyle(color: Colors.black, fontSize: 17),
                   //            ),
                   //          ],
                   //        ),
                   //        const SizedBox(
                   //          height: 10,
                   //        ),
                   //        Row(
                   //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //          children:  [
                   //            const Text(
                   //              "Group's price",
                   //              style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                   //            ),
                   //            Text(
                   //              controller.userList.data?.information?.groupPrice?.value.toString()??"",
                   //              style: const TextStyle(color: Colors.black, fontSize: 17),
                   //            ),
                   //          ],
                   //        ),
                   //        const SizedBox(
                   //          height: 10,
                   //        ),
                   //        Row(
                   //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //          children:  [
                   //            const Text(
                   //              "Student's number",
                   //              style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                   //            ),
                   //            Text(
                   //              controller.userList.data?.information?.studentsLength?.value.toString()??"",
                   //              style: const TextStyle(color: Colors.black, fontSize: 17),
                   //            ),
                   //          ],
                   //        ),
                   //        const SizedBox(
                   //          height: 10,
                   //        ),
                   //        Row(
                   //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //          children:  [
                   //            const Text(
                   //              "Teacher's name",
                   //              style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                   //            ),
                   //            Text(
                   //              controller.userList.data?.information?.teacherName?.value??"",
                   //              style: const TextStyle(color: Colors.black, fontSize: 17),
                   //            ),
                   //          ],
                   //        ),
                   //        const SizedBox(
                   //          height: 10,
                   //        ),
                   //        Row(
                   //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //          children:  [
                   //            const Text(
                   //              "Teacher's lastName",
                   //              style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                   //            ),
                   //            Text(
                   //              controller.userList.data?.information?.teacherSurname?.value??"",
                   //              style: const TextStyle(color: Colors.black, fontSize: 17),
                   //            ),
                   //          ],
                   //        ),
                   //        const SizedBox(
                   //          height: 10,
                   //        ),
                   //        Row(
                   //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //          children:  [
                   //            const Text(
                   //              "Holder",
                   //              style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                   //            ),
                   //            Text(
                   //              controller.userList.data?.information?.teacherSalary?.value?.toString()??"",
                   //              style: const TextStyle(color: Colors.black, fontSize: 17),
                   //            ),
                   //          ],
                   //        ),
                   //      ],
                   //    ),
                   //  ),
                    controller.isLoading ? const Center(child: CircularProgressIndicator(),):const SizedBox.shrink(),
                   // #group students list with their monthly payment schedule which is shown,once the user swipes from left to right
                    Expanded(
                          child: ListView.builder(
                            itemCount: controller.listOfStudents.length,
                            itemBuilder:(BuildContext context,int index){
                              StudentsData students = controller.listOfStudents[index];
                              return listOfUsers(students,controller);
                            },
                          ),
                        ),
                  ],
                ),
              ),
          );
        },
      ),
    );

  }
}
