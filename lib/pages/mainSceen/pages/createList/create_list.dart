
import 'dart:math';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:appinio_animated_toggle_tab/appinio_animated_toggle_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/create_list.dart';
import 'package:gennis_innovative_school/logService/log_service.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../../../networkService/network_service.dart';
class CheckList extends StatefulWidget {
  final int ids;

  const CheckList({Key? key, required this.ids}) : super(key: key);
  static const String id = "createList";

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
   int? selectedDay;
   String? selectedMonth;

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
                  //#List of students
                  SizedBox(
                    height: 600,
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
                                title: Text(controller.listOfStudents[controller.index].surname ?? '', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                subtitle: Text(controller.listOfStudents[controller.index].name ?? '', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
                                // trailing: Transform.scale(
                                //   scale: 1.8,
                                //   child: Checkbox(
                                //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                //     value: controller.listOfStudents[controller.index].typeChecked == 'yes',
                                //     onChanged: (selected) {
                                //       setState(() {
                                //         if(selected == true){
                                //           setState(() {
                                //             controller.listOfStudents[controller.index].typeChecked = 'yes';
                                //           });
                                //
                                //         }else{
                                //           setState(() {
                                //             controller.listOfStudents[controller.index].typeChecked = 'no';
                                //           });
                                //         }
                                //       });
                                //     },
                                //     autofocus: false,
                                //     checkColor: Colors.white,
                                //     activeColor: Colors.blue,
                                //     shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3.5),),),
                                //     tristate: true,
                                //   ),
                                // ),//
                                /******************/
                                trailing: AnimatedToggleSwitch<int>.size(
                                  current: 0,
                                  values: const [0, 1],
                                  iconOpacity: 0.2,
                                  indicatorSize: const Size.fromWidth(50),
                                  iconBuilder: (value, size) {
                                    IconData data = Icons.clear;
                                    if (value.isEven) data = Icons.check;
                                    return Icon(data, size: 44,color: Colors.white,);
                                  },
                                  borderColor: controller.value.isEven ? const Color(0xFFF8220B) : const Color(0xFF06EA19),
                                  iconAnimationType: AnimationType.onSelected,
                                  colorBuilder: (isColor) => isColor.isEven ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
                                  onChanged: (selected) {
                                    if(controller.isSelected == true){
                                      if(selected == 0){
                                        setState(() {
                                          controller.listOfStudents[index].typeChecked = 'yes';
                                          print('typeChecked YES: ---${controller.listOfStudents[index].typeChecked = 'yes'}');
                                        });
                                      }
                                    } else if(controller.isSelected == false){
                                      if(selected == 1){
                                        setState(() {
                                          controller.listOfStudents[index].typeChecked = 'no';
                                          print('typeChecked NO: ---${controller.listOfStudents[index].typeChecked = 'no'}');
                                        });
                                      }
                                    }
                                    print('controller.value:----${controller.value}');
                                    print('selected: -----${selected}');
                                    },


                                ),
                              ),
                            );
                          },
                        ),
                        controller.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //#dates and submit button
                  SizedBox(
                    height: 90,
                    child: Card(
                      color: Colors.cyanAccent,
                      child: Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //#dateTime
                              SizedBox(
                                  height: 55,
                                  width: 180,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DropdownButton<int>(
                                        value:selectedDay,
                                        hint: const Text('Day',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                        onChanged: (int? newValue) {
                                          setState(() {
                                            selectedDay = newValue!;
                                          });
                                        },
                                        items: controller.listOfDay.map<DropdownMenuItem<int>>((int value) {
                                          return DropdownMenuItem<int>(value: value, child: Text(value.toString()),);}).toList(),
                                      ),
                                      DropdownButton<String>(
                                        value: selectedMonth,
                                        hint: const Text('Month',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedMonth = newValue!;
                                          });
                                        },
                                        items: controller.listOfMonth.map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(value: value, child: Text(value),);}).toList(),
                                      ),
                                    ],
                                  )),
                              const SizedBox(width: 70,),
                              //#submit button
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  width: 120,
                                  child: ElevatedButton(
                                    onPressed: () async{
                                      Student students = Student();
                                      for (var studentsList in controller.listOfStudents) {
                                        students= Student(
                                              age: 0,
                                              attended: "",
                                              comment: "",
                                              date: Dateses(day: selectedDay, month: selectedMonth),
                                              id: studentsList.id,
                                              img: '',
                                              money: 0,
                                              moneyType: "",
                                              name: '',
                                              phone: '',
                                              photoProfile:'',
                                              reason:'',
                                              regDate: '',
                                              role: '',
                                              scores: Scoreses(),
                                              surname: '',
                                              typeChecked: studentsList.typeChecked,
                                              username: ''
                                        );
                                      }
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      var id = prefs.getInt('ids');
                                      Attendance attendance = Attendance(groupId: id,  student: students);
                                      Get.find<CreateController>().apiPostOfStudentsAttendance(attendance);
                                    },
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent, side: const BorderSide(width: 2, color: Colors.white)),
                                    child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
                                    ),
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