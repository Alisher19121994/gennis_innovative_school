import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/create_list.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../globalModel/create_new_users.dart';

class CheckList extends StatefulWidget {
  final int ids;
  const CheckList({Key? key, required this.ids}) : super(key: key);
  static const String id = "createList";
  @override
  State<CheckList> createState() => _CheckListState();
}
class _CheckListState extends State<CheckList> {
  var isChecked = false;

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
              //return listOfStudentsCheck(controller);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    //#List of students
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.4,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          ListView.builder(
                            itemCount: controller.listOfStudents.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 3.0,right: 3.0,top: 3.0),
                                    padding: const EdgeInsets.only(left: 4.0,right: 4.0,top: 4.0,bottom: 4.0),
                                    height: 55,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                     // color:  const Color(0xFFE1E8ED),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(controller.listOfStudents[index].surname ?? '', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                            const SizedBox(width: 8.0,),
                                            Text(controller.listOfStudents[index].name ?? '', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18), overflow: TextOverflow.ellipsis)
                                          ],
                                        ),
                                              AnimatedToggleSwitch<int>.size(
                                                current: controller.listOfStudents[index].isChecked ?? 1,
                                                values: const [0, 1],
                                                iconOpacity: 0.2,
                                                indicatorSize: const Size.fromRadius(24),
                                                iconBuilder: (value, size) {
                                                  IconData data = Icons.clear;
                                                  if (value.isEven) data = Icons.check;
                                                  return Icon(data, size: 30,color: Colors.white,);
                                                },
                                                borderColor: controller.listOfStudents[index].isChecked == 0 ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
                                                iconAnimationType: AnimationType.onSelected,
                                                colorBuilder: (isColor) => isColor.isEven ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
                                                onChanged: (selected){
                                                setState(() {
                                                  controller.listOfStudents[index].isChecked = selected;
                                                });
                                                  switch (controller.listOfStudents[index].isChecked) {
                                                    case 0: {
                                                      setState(() {
                                                        controller.listOfStudents[index].typeChecked = 'yes';
                                                      });
                                                    }
                                                    break;
                                                    case 1: {
                                                      setState(() {
                                                        controller.listOfStudents[index].typeChecked = 'no';

                                                      });
                                                    }
                                                    break;
                                                  }
                                                },
                                              ),
                                        // Transform.scale(
                                        //   scale: 2.0,
                                        //   child: Checkbox(
                                        //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        //     //activeColor: Colors.blue,
                                        //     checkColor: Colors.white,
                                        //     tristate: true,
                                        //     fillColor: MaterialStateProperty.all(Colors.blue),
                                        //     overlayColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                                        //     splashRadius: 20,
                                        //     shape: RoundedRectangleBorder(
                                        //       borderRadius: BorderRadius.circular(3.0),
                                        //     ),
                                        //
                                        //     value:controller.listOfStudents[index].isChecked,
                                        //     onChanged: (bool? value) {
                                        //       setState(() {
                                        //         controller.listOfStudents[index].isChecked = value!;
                                        //         switch(controller.listOfStudents[index].isChecked){
                                        //           case true:{
                                        //             setState(() {
                                        //               controller.listOfStudents[index].typeChecked = 'yes';
                                        //               print(controller.listOfStudents[index].typeChecked = 'yes');
                                        //             });
                                        //           } break;
                                        //           case false:{
                                        //             setState(() {
                                        //               controller.listOfStudents[index].typeChecked = 'no';
                                        //               print(controller.listOfStudents[index].typeChecked = 'no');
                                        //             });
                                        //           } break;
                                        //           default:{
                                        //             controller.listOfStudents[index].typeChecked = 'no';
                                        //             print(controller.listOfStudents[index].typeChecked = 'no');
                                        //           }
                                        //         }
                                        //
                                        //       });
                                        //
                                        //     },
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  const Divider(thickness: 1.0,)
                                ],
                              );
                            },
                          ),
                          controller.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : const SizedBox.shrink(),

                        ],
                      ),
                    ),
                    //#dates and submit button
                    SizedBox(
                      height: 70,
                      child: Card(
                        color:  const Color(0xFFE1E8ED),
                        child: Container(
                            height: 70,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //#dateTime
                                SizedBox(
                                    height: 45,
                                    width: 180,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        DropdownButton<int>(
                                          value:controller.selectedDay,
                                          hint: const Text('Day',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                          onChanged: (int? newValue) {
                                            setState(() {
                                              controller.selectedDay = newValue!;
                                            });
                                          },
                                          items: controller.listOfDay.map<DropdownMenuItem<int>>((int value) {
                                            return DropdownMenuItem<int>(value: value, child: Text(value.toString()),);}).toList(),
                                        ),
                                        DropdownButton<String>(
                                          value: controller.selectedMonth,
                                          hint: const Text('Month',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              controller.selectedMonth = newValue!;
                                            });
                                          },
                                          items: controller.listOfMonth.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(value: value, child: Text(value),);}).toList(),
                                        ),
                                      ],
                                    )),
                                const SizedBox(width: 10,),
                                //#submit button
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    width: 120,
                                    child: ElevatedButton(
                                      onPressed: () async{
                                        List<NewScores> listOfScore=[];
                                        List<Stars> starsList = [];
                                        List<int> list = [1,2,3,4,5];
                                        starsList.clear();
                                        // for (int i = 0; i < list.length; i++) {
                                        //   if (list[i] <= controller.rating) {
                                        //     list[i] = 'true';
                                        //    // starsList.add(Stars(active: 'true'));
                                        //   } else {
                                        //     list[i] = Stars(active: 'false');
                                        //     //starsList.add(Stars(active: 'false'));
                                        //   }
                                        // }
                                        // starsList.add(Stars(active: list));
                                        NewScores newScore = NewScores(activeStars: controller.rating, id: 0, name: '', stars: starsList, title: '');
                                        listOfScore.add(newScore);
                                        print('newScore: ${newScore.activeStars}');
                                        print('id: ${newScore.id}');
                                        print('name: ${newScore.name}');
                                        print('title: ${newScore.title}');
                                        print('starsList: ${starsList}');
                                        print('listOfScore: $listOfScore');
                                        // for (var item in controller.listOfStudents) {
                                        //   listOfScore.add(NewScores(
                                        //     activeStars: item.scores?.activeStars,
                                        //     id: item.scores?.id,
                                        //     name: item.scores?.name,
                                        //     stars: stars,
                                        //     title: item.scores?.title,
                                        //   ));
                                        //
                                        //   print('activestars: ${item.scores?.activeStars}');
                                        //   print('id: ${item.scores?.id}');
                                        //   print('name: ${item.scores?.name}');
                                        //   print('stars: ${item.scores?.stars}');
                                        //   print('title: ${item.scores?.title}');
                                        // }
                                        StudentListOfUser students = StudentListOfUser();
                                        for (var studentsList in controller.listOfStudents) {
                                          students= StudentListOfUser(
                                              active: "",
                                              checked: "",
                                              date: DatesOfUsers(day: controller.selectedDay.toString(), month: controller.selectedMonth),
                                              id: studentsList.id,
                                              money: 0,
                                              moneyType: "",
                                              name: '',
                                              profilePhoto:'',
                                              requestMsg:'',
                                              requestType: '',
                                              scores: listOfScore,
                                              surname: '',
                                              typeChecked: studentsList.typeChecked,
                                          );
                                        }
                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        var id = prefs.getInt('ids');
                                        CreateAttendances attendance = CreateAttendances(groupId: id.toString(),  student: students);
                                        Get.find<CreateController>().apiPostOfStudentsAttendance(attendance,context);
                                      },
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent, side: const BorderSide(width: 1, color: Colors.white)),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}