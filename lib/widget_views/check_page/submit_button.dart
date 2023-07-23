import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/create_list.dart';
import '../../pages/mainSceen/pages/usersList/model/users.dart';

Widget submitButton(UserList userList,CreateController controller,int index){
  return SizedBox(
    height: 90,
    child:  Card(
      color: Colors.cyanAccent,
      child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20,),
              //#dateTime
              SizedBox(
                  height: 55,
                  width: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.cyan
                        ),
                        child: Text("${controller.listOfStudents[index].date?.day}",style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                      const SizedBox(width: 14,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.cyan
                        ),
                        child: Text("${controller.listOfStudents[index].date?.month}",style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  )
              ),
              const SizedBox(width: 70,),
              //#submit button
              Expanded(
                child: SizedBox(height: 55, width: 80,
                  child: ElevatedButton(
                    onPressed: () {
                      // for(var studentsList in controller.listOfStudents){
                      //   Students students = Students(studentsList.date?.day as Date,studentsList.date?.month.toString() as Date, studentsList.typeChecked.toString());
                      //   userList = UserList(data: DataList(students: students as List<Students>));
                      // }
                      Get.find<CreateController>().apiPostOfStudentsAttendance(userList);
                      controller.isLoading
                          ? const Center(
                          child: CircularProgressIndicator())
                          : const SizedBox.shrink();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent, side: const BorderSide(width: 2, color: Colors.white)),
                    child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ],
          )),
    ),
  );
}