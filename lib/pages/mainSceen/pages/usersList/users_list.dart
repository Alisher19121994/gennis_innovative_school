import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gennis_innovative_school/controller/users_list.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../../../widget_views/list_of_users.dart';
import '../../../entrancePage/model/groups_data.dart';
import 'model/users.dart';

class UsersList extends StatefulWidget {
  final int ids;

   UsersList({Key? key, required this.ids,}) : super(key: key);
  static const String id = "usersList";

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  //
  // var isPaid = true;
  // var isLoading = false;
  //
  // var logger = Logger();
  // Students students= Students();
  // UserList usersList = UserList();
  // List<Students> listOfUsers = [];

  @override
  void initState() {
    super.initState();
    //fetchData();
    Get.find<UserListController>().apiListOfStudents(widget.ids);
  }

  // void fetchData()async{
  //   var logger = Logger();
  //   var token = await SharedPreferenceData.getToken();
  //   final response = await http.get(
  //        Uri.parse('http://176.96.243.55/api/group_profile/${widget.ids}'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       }
  //   );
  //   final Map<String,dynamic> body = jsonDecode(response.body.toString());
  //   final UserList userList = UserList.fromJson(body);
  //
  //   logger.i(body);
  //
  //   setState(() {
  //     isPaid == true;
  //     listOfUsers = userList as List<Students>;
  //   });
  //
  //
  //   if(students.money! > 0 ){
  //     setState(() {
  //       isPaid == true;
  //     });
  //   }else{
  //     setState(() {
  //       isPaid == false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body:GetBuilder<UserListController>(
        init: UserListController(),
        builder: (controller){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             // #group overall views in the basic schedule
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.lightBlueAccent),
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(16),
                height: 270,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Educational language",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          //usersList.data.information.eduLang.value,
                          controller.userList.data?.information?.eduLang?.value??"",
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Course type",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.userList.data?.information?.groupCourseType?.value??"",
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Group's name",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.userList.data?.information?.groupName?.value??"",
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Group's price",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.userList.data?.information?.groupPrice?.value.toString()??"",
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Student's number",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.userList.data?.information?.studentsLength?.value.toString()??"",
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Teacher's name",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.userList.data?.information?.teacherName?.value??"",
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Teacher's lastName",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.userList.data?.information?.teacherSurname?.value??"",
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Holder",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          controller.userList.data?.information?.teacherSalary?.value?.toString()??"",
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
             // #group students list with their monthly payment schedule which is shown,once the user swipes from left to right
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.cyanAccent,
                  child: ListView.builder(
                    itemCount: controller.listOfStudents.length,
                    itemBuilder:(BuildContext context,int index){
                      Students students = controller.listOfStudents[index];
                      return listOfUsers(students,controller);
                    },
                  ),
                ),
              ),
              controller.isLoading ? const Center(child: CircularProgressIndicator(),):const SizedBox.shrink(),
            ],
          );
        },
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         //#group overall views in the basic schedule
      //         Container(
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(17),
      //               color: Colors.lightBlueAccent),
      //           margin: const EdgeInsets.all(6),
      //           padding: const EdgeInsets.all(16),
      //           height: 270,
      //           child: Column(
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children:  [
      //                   const Text(
      //                     "Educational language",
      //                     style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
      //                   ),
      //                   Text(
      //                     //usersList.data.information.eduLang.value,
      //                     usersList.data?.information?.eduLang?.value??"",
      //                     style: const TextStyle(color: Colors.black, fontSize: 17),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children:  [
      //                   const Text(
      //                     "Course type",
      //                     style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
      //                   ),
      //                   Text(
      //                     usersList.data?.information?.groupCourseType?.value??"",
      //                     style: const TextStyle(color: Colors.black, fontSize: 17),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children:  [
      //                   const Text(
      //                     "Group's name",
      //                     style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
      //                   ),
      //                   Text(
      //                     usersList.data?.information?.groupName?.value??"",
      //                     style: const TextStyle(color: Colors.black, fontSize: 17),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children:  [
      //                   const Text(
      //                     "Group's price",
      //                     style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
      //                   ),
      //                   Text(
      //                     usersList.data?.information?.groupPrice?.value.toString()??"",
      //                     style: const TextStyle(color: Colors.black, fontSize: 17),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children:  [
      //                   const Text(
      //                     "Student's number",
      //                     style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
      //                   ),
      //                   Text(
      //                     usersList.data?.information?.studentsLength?.value.toString()??"",
      //                     style: const TextStyle(color: Colors.black, fontSize: 17),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children:  [
      //                   const Text(
      //                     "Teacher's name",
      //                     style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
      //                   ),
      //                   Text(
      //                     usersList.data?.information?.teacherName?.value??"",
      //                     style: const TextStyle(color: Colors.black, fontSize: 17),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children:  [
      //                   const Text(
      //                     "Teacher's lastName",
      //                     style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
      //                   ),
      //                   Text(
      //                     usersList.data?.information?.teacherSurname?.value??"",
      //                     style: const TextStyle(color: Colors.black, fontSize: 17),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children:  [
      //                   const Text(
      //                     "Holder",
      //                     style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
      //                   ),
      //                   Text(
      //                     usersList.data?.information?.teacherSalary?.value?.toString()??"",
      //                     style: const TextStyle(color: Colors.black, fontSize: 17),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //         //#group students list with their monthly payment schedule which is shown,once the user swipes from left to right
      //         Expanded(
      //             child: ListView.builder(
      //               shrinkWrap: true,
      //               itemCount: listOfUsers.length,
      //               itemBuilder:(BuildContext context,int index){
      //               return _listOfUsers(listOfUsers[index]);
      //             },
      //           ),
      //         )
      //       ],
      //     ),
      // ),
    );

  }
}
