import 'dart:convert';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gennis_innovative_school/controller/create_list.dart';
import 'package:gennis_innovative_school/network/network.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/attendanceList/attendance_list.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:numberpicker/numberpicker.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../../../widget_views/check_page/create_of_users.dart';
import '../../../../widget_views/check_page/submit_button.dart';
import '../../../registration/sign_in_page.dart';
import '../usersList/model/users.dart';

class CheckList extends StatefulWidget {
  final int ids;

  const CheckList({Key? key, required this.ids}) : super(key: key);
  static const String id = "createList";

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {

  @override
  void initState() {
    super.initState();
    Get.find<CreateController>().apiCreateListOfStudents(widget.ids);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 0.8),
              child: GetBuilder<CreateController>(
                init: CreateController(),
                builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 495,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            ListView.builder(
                              itemCount: controller.listOfStudents.length,
                              itemBuilder: (context, index) {
                                controller.index = index;
                               //return listOfUsers(controller.listOfStudents[index] as CreateController, index);
                                return Card(
                                  borderOnForeground: true,
                                  color: Colors.cyanAccent,
                                  child: ListTile(
                                    leading: Text(
                                      controller.listOfStudents[index].surname ?? '',
                                      style: const TextStyle(
                                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    title: Text(
                                      controller.listOfStudents[index].name ?? '',
                                      style: const TextStyle(
                                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    trailing: Expanded(
                                      child: SizedBox(
                                        child: GestureDetector(
                                            onTap:() {
                                           controller.toggleStudentSelection();
                                            },
                                            child: AnimatedContainer(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color:controller.isChecked ? Colors.purpleAccent:Colors.transparent,
                                                border: Border.all(color: Colors.black87)
                                              ),
                                              duration: const Duration(milliseconds: 500),
                                              curve: Curves.fastLinearToSlowEaseIn,
                                              child: controller.isChecked ? IconButton(
                                                  onPressed: (){
                                                    //controller.students = Students('yes');
                                                    controller.listOfStudents[index].typeChecked = 'yes';
                                                  },
                                                  icon: const Icon(Icons.check,color: Colors.blueAccent,size: 28,))
                                                  :IconButton(
                                                  onPressed: (){
                                                    //controller.students = Students('no');
                                                    controller.listOfStudents[index].typeChecked = 'no';
                                                  },
                                                  icon: const Icon(Icons.clear,color: Colors.red,size: 28,))
                                            ),
                                          ),
                                      ),
                                    ),
                                    // trailing: Transform.scale(
                                    //   scale: 1.8,
                                    //   child: Checkbox(
                                    //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    //     value: controller.listOfStudents[index].typeChecked =='no',
                                    //     onChanged: (value) {
                                    //       setState(() {
                                    //         controller.listOfStudents[index].typeChecked = value.toString();
                                    //       });
                                    //     },
                                    //        // controller.toggleStudentSelection((controller.listOfStudents[index].typeChecked =='yes') as Students),
                                    //     checkColor: Colors.white,
                                    //     activeColor: Colors.blue,
                                    //     shape: const RoundedRectangleBorder(
                                    //       borderRadius: BorderRadius.all(
                                    //         Radius.circular(5.0),
                                    //       ),
                                    //     ),
                                    //     tristate: true,
                                    //   ),
                                    // ),
                                  ),
                                );
                              },
                            ),
                            controller.isLoading
                                ? const Center(
                                  child: CircularProgressIndicator())
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                     const SizedBox(height: 8,),
                      SizedBox(
                        height: 90,
                        child:  Card(
                          color: Colors.cyanAccent,
                          child: Container(
                              height: 80,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                          //#day
                                          Container(
                                            height: 55,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Colors.cyan
                                            ),
                                            child: ListView.builder(
                                              itemCount: controller.listOfStudents.length,
                                                itemBuilder: (context,index) {
                                                  return Center(
                                                      child: Text(
                                                    "${controller.listOfStudents[index].date?.day}", style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),));
                                                }
                                                ),
                                          ),
                                          //#month
                                          Container(
                                            height: 55,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Colors.cyan
                                            ),
                                            child: ListView.builder(
                                                itemCount: controller.listOfStudents.length,
                                                itemBuilder: (context,index) {
                                                  return Center(child: Text(
                                                    "${controller
                                                        .listOfStudents[index]
                                                        .date?.month}",
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight
                                                            .bold),));
                                                }
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                  const SizedBox(width: 70,),
                                  //#submit button
                                  Expanded(
                                    child: SizedBox(height: 55, width: 120,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          for(var studentsList in controller.listOfStudents){
                                            controller.userList = UserList(data: DataList(students: studentsList as List<Students>));
                                          }
                                          if(controller.response.statusCode == 200){
                                            Get.find<CreateController>().apiPostOfStudentsAttendance(controller.userList);
                                            controller.finish(context);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent, side: const BorderSide(width: 2, color: Colors.white)),
                                        child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
  }
}
