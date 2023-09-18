import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/users_list.dart';
import '../../pages/mainSceen/pages/usersList/model/users.dart';
import 'list_of_users.dart';

Widget listOfGroups(BuildContext context,UserListController controller){
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient:  const LinearGradient(
                colors: [
                  Color(0xFF00C2FF),
                  Colors.cyanAccent,
                ],
                stops: [0.0, 1.0],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                tileMode: TileMode.repeated
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.all(8.0),
          height: 270,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text('Language',
                    //controller.userList.data?.information?.eduLang?.name ?? "",
                    style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                  ),
                  Text(
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
                    //controller.userList.data?.information?.groupCourseType?.name??"" ,
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
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            children: [
              ListView.builder(
                itemCount: controller.listOfStudents.length,
                itemBuilder:(BuildContext context,int index){
                  StudentsData students = controller.listOfStudents[index];
                  return listOfUsers(students,controller);
                },
              ),
              controller.isLoading ? const Center(child: CircularProgressIndicator(),):const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    ),
  );
}