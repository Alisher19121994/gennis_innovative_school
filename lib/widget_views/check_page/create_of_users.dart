import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/create_list.dart';
import '../../globalModel/create_new_users.dart';
import '../../pages/mainSceen/pages/createList/model/attendanceUser/attendance.dart';

// Widget listOfStudentsCheck(BuildContext context,CreateController controller) {
//   return SingleChildScrollView(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         //#List of students
//         SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: double.infinity,
//           child: Stack(
//             children: [
//               ListView.builder(
//                 itemCount: controller.listOfStudents.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     borderOnForeground: true,
//                     color: Colors.cyanAccent,
//                     child: ListTile(
//                         title: Text(controller.listOfStudents[index].surname ?? '',
//                           style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
//                         subtitle: Text(controller.listOfStudents[index].name ?? '',
//                             style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),   overflow: TextOverflow.ellipsis),
//                         trailing:AnimatedToggleSwitch<int>.size(
//                           current: controller.isSelected,
//                           values: const [0, 1],
//                           iconOpacity: 0.2,
//                           indicatorSize: const Size.fromRadius(24),
//                           iconBuilder: (value, size) {
//                             IconData data = Icons.clear;
//                             if (value.isEven) data = Icons.check;
//                             return Icon(data, size: 44,color: Colors.white,);
//                           },
//                           borderColor: controller.isSelected.isEven ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
//                           iconAnimationType: AnimationType.onSelected,
//                           colorBuilder: (isColor) => isColor.isEven ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
//                           onChanged: (selected) => setState((){
//                             controller.isSelected = selected;
//                             switch (controller.isSelected) {
//                               case 0: {
//                                 setState(() {
//                                   controller.listOfStudents[index].typeChecked = 'yes';
//                                 });
//                               }
//                               break;
//                               case 1: {
//                                 setState(() {
//                                   controller.listOfStudents[index].typeChecked = 'no';
//                                 });
//                               }
//                               break;
//                               default: { }
//                             }
//                             print(controller.isSelected);
//                           }),
//                         )
//                       // Row(
//                       //   crossAxisAlignment: CrossAxisAlignment.start,
//                       //   children: [
//                       //     controller.isSelected == 0 ? const SizedBox(
//                       //       height: 40,
//                       //       width: 100,
//                       //       child: Center(
//                       //         child: Text('Available',style: TextStyle(
//                       //             color: Color(0xFF06EA19),fontSize: 18,fontWeight: FontWeight.bold
//                       //         ),),
//                       //       ),
//                       //     )
//                       //         :const SizedBox(
//                       //       height: 40,
//                       //       width: 100,
//                       //       child: Center(
//                       //         child: Text('Absent',style: TextStyle(
//                       //             color: Color(0xFFF8220B),fontSize: 18,fontWeight: FontWeight.bold
//                       //         ),),
//                       //       ),
//                       //     ),
//                       //     const SizedBox(width: 18,),
//                       //     AnimatedToggleSwitch<int>.size(
//                       //       current: controller.isSelected,
//                       //       values: const [0, 1],
//                       //       iconOpacity: 0.2,
//                       //       indicatorSize: const Size.fromRadius(24),
//                       //       iconBuilder: (value, size) {
//                       //         IconData data = Icons.clear;
//                       //         if (value.isEven) data = Icons.check;
//                       //         return Icon(data, size: 44,color: Colors.white,);
//                       //       },
//                       //       borderColor: controller.isSelected.isEven ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
//                       //       iconAnimationType: AnimationType.onSelected,
//                       //       colorBuilder: (isColor) => isColor.isEven ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
//                       //       onChanged: (selected) => setState((){
//                       //         controller.isSelected = selected;
//                       //         switch (controller.isSelected) {
//                       //           case 0: {
//                       //             setState(() {
//                       //               controller.listOfStudents[index].typeChecked = 'yes';
//                       //             });
//                       //           }
//                       //           break;
//                       //           case 1: {
//                       //             setState(() {
//                       //               controller.listOfStudents[index].typeChecked = 'no';
//                       //             });
//                       //           }
//                       //           break;
//                       //           default: { }
//                       //         }
//                       //         print(controller.isSelected);
//                       //       }),
//                       //     ),
//                       //   ],
//                       // ),
//                       /*****************/
//                       // subtitle:Column(
//                       //   crossAxisAlignment: CrossAxisAlignment.start,
//                       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //   children: [
//                       //     Row(
//                       //       crossAxisAlignment: CrossAxisAlignment.start,
//                       //       children: [
//                       //         controller.isSelected == 0 ? const SizedBox(
//                       //           height: 40,
//                       //           width: 100,
//                       //           child: Center(
//                       //             child: Text('Available',style: TextStyle(
//                       //                 color: Color(0xFF06EA19),fontSize: 18,fontWeight: FontWeight.bold
//                       //             ),),
//                       //           ),
//                       //         )
//                       //             :const SizedBox(
//                       //             height: 40,
//                       //             width: 100,
//                       //               child: Center(
//                       //                 child: Text('Absent',style: TextStyle(
//                       //                 color: Color(0xFFF8220B),fontSize: 18,fontWeight: FontWeight.bold
//                       //             ),),
//                       //           ),
//                       //         ),
//                       //         const SizedBox(width: 18,),
//                       //         AnimatedToggleSwitch<int>.size(
//                       //           current: controller.isSelected,
//                       //           values: const [0, 1],
//                       //           iconOpacity: 0.2,
//                       //           indicatorSize: const Size.fromRadius(24),
//                       //           iconBuilder: (value, size) {
//                       //             IconData data = Icons.clear;
//                       //             if (value.isEven) data = Icons.check;
//                       //             return Icon(data, size: 44,color: Colors.white,);
//                       //           },
//                       //           borderColor: controller.isSelected.isEven ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
//                       //           iconAnimationType: AnimationType.onSelected,
//                       //           colorBuilder: (isColor) => isColor.isEven ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
//                       //           onChanged: (selected) => setState((){
//                       //             controller.isSelected = selected;
//                       //             switch (controller.isSelected) {
//                       //               case 0: {
//                       //                 setState(() {
//                       //                   controller.listOfStudents[index].typeChecked = 'yes';
//                       //                 });
//                       //               }
//                       //               break;
//                       //               case 1: {
//                       //                 setState(() {
//                       //                   controller.listOfStudents[index].typeChecked = 'no';
//                       //                 });
//                       //               }
//                       //               break;
//                       //               default: { }
//                       //             }
//                       //             print(controller.isSelected);
//                       //           }),
//                       //         ),
//                       //       ],
//                       //     ),
//                       //     controller.isSelected == 0 ? Column(
//                       //      children: [
//                       //        Row(
//                       //          crossAxisAlignment: CrossAxisAlignment.start,
//                       //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //          children: [
//                       //            const SizedBox(
//                       //              height: 40,
//                       //              width: 100,
//                       //              child: Center(
//                       //                child: Text('Homework',style: TextStyle(
//                       //                    color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
//                       //                ),),
//                       //              ),
//                       //            ),
//                       //            const SizedBox(width: 18,),
//                       //            Expanded(
//                       //              child: RatingBar.builder(
//                       //                initialRating: 0,
//                       //                minRating: 0,
//                       //                direction: Axis.horizontal,
//                       //                itemCount: 5,
//                       //                itemSize: 34.9,
//                       //                itemPadding: const EdgeInsets.symmetric(horizontal: 5.2),
//                       //                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber,),
//                       //                onRatingUpdate: (rating) {
//                       //                setState(() {
//                       //                  controller.rating = rating.toInt();
//                       //                  // controller.listOfStudents[index].scores?.activeStars = rating.toInt();
//                       //                  // print('controller.listOfStudents[index]: ${ controller.listOfStudents[index].scores?.activeStars = rating.toInt()}');
//                       //                });
//                       //                },
//                       //              ),
//                       //            ),
//                       //          ],
//                       //        ),
//                       //        const SizedBox(height: 6,),
//                       //        Row(
//                       //          crossAxisAlignment: CrossAxisAlignment.start,
//                       //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //          children: [
//                       //            const SizedBox(
//                       //              height: 40,
//                       //              width: 100,
//                       //              child: Center(
//                       //                child: Text('Attendance',style: TextStyle(
//                       //                    color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
//                       //                ),),
//                       //              ),
//                       //            ),
//                       //            const SizedBox(width: 18,),
//                       //            Expanded(
//                       //              child: RatingBar.builder(
//                       //                initialRating: 0,
//                       //                minRating: 0,
//                       //                direction: Axis.horizontal,
//                       //                itemCount: 5,
//                       //                itemSize: 34.9,
//                       //                itemPadding: const EdgeInsets.symmetric(horizontal: 5.2),
//                       //                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber,),
//                       //                onRatingUpdate: (rating) {
//                       //                },
//                       //              ),
//                       //            ),
//                       //          ],
//                       //        ),
//                       //      ],
//                       //    )
//                       //         : Container()
//                       //
//                       //   ],
//                       // ),
//                       /**********************/
//                       // trailing: AnimatedToggleSwitch<int>.size(
//                       //   current: controller.isSelected,
//                       //   values: const [0, 1],
//                       //   iconOpacity: 0.2,
//                       //   indicatorSize: const Size.fromRadius(24),
//                       //   iconBuilder: (value, size) {
//                       //     IconData data = Icons.clear;
//                       //     if (value.isEven) data = Icons.check;
//                       //     return Icon(data, size: 44,color: Colors.white,);
//                       //   },
//                       //   borderColor: controller.isSelected.isEven ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
//                       //   iconAnimationType: AnimationType.onSelected,
//                       //   colorBuilder: (isColor) => isColor.isEven ? const Color(0xFF06EA19) : const Color(0xFFF8220B),
//                       //   onChanged: (selected) => setState((){
//                       //     controller.isSelected = selected;
//                       //     switch (controller.isSelected) {
//                       //       case 0: {
//                       //               setState(() {
//                       //                 controller.listOfStudents[index].typeChecked = 'yes';
//                       //               });
//                       //       }
//                       //       break;
//                       //       case 1: {
//                       //           setState(() {
//                       //             controller.listOfStudents[index].typeChecked = 'no';
//                       //           });
//                       //       }
//                       //       break;
//                       //       default: { }
//                       //     }
//                       //     print(controller.isSelected);
//                       //   }),
//                       // ),
//                     ),
//                   );
//                 },
//               ),
//               controller.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : const SizedBox.shrink(),
//
//             ],
//           ),
//         ),
//         //#dates and submit button
//         SizedBox(
//           height: 80,
//           child: Card(
//             color: Colors.cyanAccent,
//             child: Container(
//                 height: 80,
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     //#dateTime
//                     SizedBox(
//                         height: 55,
//                         width: 180,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             DropdownButton<int>(
//                               value:controller.selectedDay,
//                               hint: const Text('Day',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
//                               onChanged: (int? newValue) {
//                                 setState(() {
//                                   controller.selectedDay = newValue!;
//                                 });
//                               },
//                               items: controller.listOfDay.map<DropdownMenuItem<int>>((int value) {
//                                 return DropdownMenuItem<int>(value: value, child: Text(value.toString()),);}).toList(),
//                             ),
//                             DropdownButton<String>(
//                               value: controller.selectedMonth,
//                               hint: const Text('Month',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   controller.selectedMonth = newValue!;
//                                 });
//                               },
//                               items: controller.listOfMonth.map<DropdownMenuItem<String>>((String value) {
//                                 return DropdownMenuItem<String>(value: value, child: Text(value),);}).toList(),
//                             ),
//                           ],
//                         )),
//                     const SizedBox(width: 70,),
//                     //#submit button
//                     Expanded(
//                       child: SizedBox(
//                         height: 55,
//                         width: 120,
//                         child: ElevatedButton(
//                           onPressed: () async{
//                             List<NewScores> listOfScore=[];
//                             List<Stars> starsList = [];
//                             List<int> list = [1,2,3,4,5];
//                             starsList.clear();
//                             // for (int i = 0; i < list.length; i++) {
//                             //   if (list[i] <= controller.rating) {
//                             //     list[i] = 'true';
//                             //    // starsList.add(Stars(active: 'true'));
//                             //   } else {
//                             //     list[i] = Stars(active: 'false');
//                             //     //starsList.add(Stars(active: 'false'));
//                             //   }
//                             // }
//                             // starsList.add(Stars(active: list));
//                             NewScores newScore = NewScores(activeStars: controller.rating, id: 0, name: '', stars: starsList, title: '');
//                             listOfScore.add(newScore);
//                             print('newScore: ${newScore.activeStars}');
//                             print('id: ${newScore.id}');
//                             print('name: ${newScore.name}');
//                             print('title: ${newScore.title}');
//                             print('starsList: ${starsList}');
//                             print('listOfScore: $listOfScore');
//                             // for (var item in controller.listOfStudents) {
//                             //   listOfScore.add(NewScores(
//                             //     activeStars: item.scores?.activeStars,
//                             //     id: item.scores?.id,
//                             //     name: item.scores?.name,
//                             //     stars: stars,
//                             //     title: item.scores?.title,
//                             //   ));
//                             //
//                             //   print('activestars: ${item.scores?.activeStars}');
//                             //   print('id: ${item.scores?.id}');
//                             //   print('name: ${item.scores?.name}');
//                             //   print('stars: ${item.scores?.stars}');
//                             //   print('title: ${item.scores?.title}');
//                             // }
//
//                             StudentListOfUser students = StudentListOfUser();
//                             for (var studentsList in controller.listOfStudents) {
//                               students= StudentListOfUser(
//                                 active: "",
//                                 checked: "",
//                                 date: DatesOfUsers(day: controller.selectedDay.toString(), month: controller.selectedMonth),
//                                 id: studentsList.id,
//                                 money: 0,
//                                 moneyType: "",
//                                 name: '',
//                                 profilePhoto:'',
//                                 requestMsg:'',
//                                 requestType: '',
//                                 scores: listOfScore,
//                                 surname: '',
//                                 typeChecked: studentsList.typeChecked,
//                               );
//                             }
//                             SharedPreferences prefs = await SharedPreferences.getInstance();
//                             var id = prefs.getInt('ids');
//                             CreateAttendances attendance = CreateAttendances(groupId: id.toString(),  student: students);
//                             Get.find<CreateController>().apiPostOfStudentsAttendance(attendance);
//                           },
//                           style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent, side: const BorderSide(width: 1, color: Colors.white)),
//                           child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),
//           ),
//         ),
//         const SizedBox(height: 40,),
//       ],
//     ),
//   );
// }
