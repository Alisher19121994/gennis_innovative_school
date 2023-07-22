import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/create_list.dart';
import '../../pages/mainSceen/pages/usersList/model/users.dart';

Widget submitButton(CreateController controller,Date dateOfDay,Date dateOfMonth,){
  return   Card(
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
                width: 250,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    onDateTimeChanged: (selectedDateTime) {
                      dateOfDay = selectedDateTime as Date;
                      dateOfMonth = selectedDateTime as Date;
                      // controller.students = Students((
                      //     controller.students.date?.day =
                      //         selectedDateTime.day) as Date, (
                      //     controller.students.date?.month =
                      //         selectedDateTime.month.toString()) as Date);
                    })
                ),
            const SizedBox(width: 70,),
            //#submit button
            Expanded(
              child: SizedBox(height: 55, width: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // List<Students> selectedItems = [];
                    // controller.listOfStudents.forEach((key, value) {
                    //   if (value) {selectedItems.add(key);
                    //   }} as void Function(Students element));
                    // controller.apiPostUsers(selectedItems);
                    //final selectedStudents = controller.listOfStudents.where((studentData) => studentData.typeChecked.toString()).toList();
                    for(var studentsList in controller.listOfStudents){
                      if(studentsList.date?.day == dateOfDay.day
                          && studentsList.date?.month.toString() == dateOfDay.month
                          && studentsList.typeChecked != null){
                        Students students = Students(studentsList.date?.day as Date,studentsList.date?.month.toString() as Date,
                            studentsList.typeChecked.toString());
                        Get.find<CreateController>().apiPostOfStudentsAttendance(students);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent, side: const BorderSide(width: 2, color: Colors.white)),
                  child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ],
        )),
  );
}