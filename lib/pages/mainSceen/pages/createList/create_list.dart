
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/create_list.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import '../usersList/model/users.dart';

class CheckList extends StatefulWidget {
  final int ids;

  const CheckList({Key? key, required this.ids}) : super(key: key);
  static const String id = "createList";

  @override
  State<CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  int day = 0;
  String month = '';
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllermonth = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.find<CreateController>().apiCreateListOfStudents(widget.ids);
    Get.find<CreateController>().dayOfDate();
    Get.find<CreateController>().monthOfDate();
  }
  var isChecked = false;
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
                                    trailing: Transform.scale(
                                      scale: 1.8,
                                      child: Checkbox(
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: isChecked = controller.listOfStudents[index].typeChecked == 'no',
                                        onChanged: (newValue) {
                                          setState(() {
                                            isChecked = newValue!;
                                            if( isChecked ){
                                              isChecked = controller.listOfStudents[index].typeChecked == 'yes';
                                            }else{
                                            isChecked = controller.listOfStudents[index].typeChecked == 'no';
                                            }
                                          });
                                        },
                                        autofocus: false,
                                        checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(3.5),
                                          ),
                                        ),
                                        tristate: true,
                                      ),
                                    ),
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
                                                color: Colors.cyanAccent
                                            ),
                                          child: ListView.builder(
                                            itemCount: controller.listOfDay.length,
                                            itemBuilder: (context, index){
                                              return Card(
                                                color: Colors.cyanAccent,
                                                child: Container(
                                                  margin: const EdgeInsets.only(top: 12),
                                                  child: Center(
                                                    child: Text('${controller.listOfDay[index]}',
                                                    style: const TextStyle(color: Colors.cyanAccent,fontSize: 22,fontWeight: FontWeight.bold),),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          // child:TextFormField(
                                          //   controller: controllerUsername,
                                          //   style: const TextStyle(color: Colors.black),
                                          //   decoration: const InputDecoration(
                                          //       labelText: 'day',
                                          //       border: OutlineInputBorder()),
                                          //   validator: (value) {
                                          //     if (value != null && value.isEmpty) {
                                          //       return 'Username must not be empty';
                                          //     }
                                          //     return null;
                                          //   },
                                          //   onChanged: (value) => setState((){
                                          //     day = int.parse(value);
                                          //     controller.listOfStudents[controller.index].date?.day = day;
                                          //   }),
                                          // ),
                                          ),
                                          //#month
                                          Container(
                                            height: 55,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: Colors.cyanAccent
                                            ),
                                            child: ListView.builder(
                                              itemCount: controller.listOfMonth.length,
                                              itemBuilder: (context, index){
                                                return Card(
                                                  color: Colors.cyanAccent,
                                                  child: Container(
                                                    margin: const EdgeInsets.only(top: 12),
                                                    child: Center(
                                                      child: Text(controller.listOfMonth[index].toString(),
                                                        style: const TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          // Container(
                                          //   height: 55,
                                          //   width: 70,
                                          //   // decoration: BoxDecoration(
                                          //   //     borderRadius: BorderRadius.circular(5),
                                          //   //     color: Colors.cyan
                                          //   // ),
                                          //   child:TextFormField(
                                          //     controller: controllermonth,
                                          //     style: const TextStyle(color: Colors.black),
                                          //     decoration: const InputDecoration(
                                          //         labelText: 'month',
                                          //         border: OutlineInputBorder()),
                                          //     validator: (value) {
                                          //       if (value != null && value.isEmpty) {
                                          //         return 'Username must not be empty';
                                          //       }
                                          //       return null;
                                          //     },
                                          //     onChanged: (value) => setState((){
                                          //       month = value;
                                          //       controller.listOfStudents[controller.index].date?.month = month;
                                          //     }),
                                          //   ),
                                          // ),
                                        ],
                                        // child:TextFormField(
                                        //   controller: controllerUsername,
                                        //   style: const TextStyle(color: Colors.black),
                                        //   decoration: const InputDecoration(
                                        //       labelText: 'day',
                                        //       border: OutlineInputBorder()),
                                        //   validator: (value) {
                                        //     if (value != null && value.isEmpty) {
                                        //       return 'Username must not be empty';
                                        //     }
                                        //     return null;
                                        //   },
                                        //   onChanged: (value) => setState((){
                                        //     day = int.parse(value);
                                        //     controller.listOfStudents[controller.index].date?.day = day;
                                        //   }),
                                        // ),
                                      )
                                  ),
                                  const SizedBox(width: 70,),
                                  //#submit button
                                  Expanded(
                                    child: SizedBox(height: 55, width: 120,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          List<Students> list = [];
                                          var day = controller.listOfDay;
                                          var month = controller.listOfMonth;
                                          for(var studentsList in controller.listOfStudents){
                                            list.add(Students(age:studentsList.age,attended:studentsList.attended,date:Date({day,month}),id:studentsList.id,
                                                img:studentsList.img ,money:studentsList.money ,moneyType:studentsList.moneyType ,name:studentsList.name,
                                                phone:studentsList.phone ,photoProfile:studentsList.photoProfile ,reason:studentsList.reason ,
                                                regDate:studentsList.regDate ,role: studentsList.role,scores:studentsList.scores ,surname:studentsList.surname ,
                                                typeChecked:studentsList.typeChecked ,username: studentsList.username
                                            ));
                                            controller.userList = UserList(groupID: controller.userList.groupID,data: DataList(students: list));
                                          }
                                            Get.find<CreateController>().apiPostOfStudentsAttendance(controller.userList);
                                            controller.finish(context);
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
