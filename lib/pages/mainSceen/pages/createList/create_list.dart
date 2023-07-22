import 'dart:convert';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gennis_innovative_school/controller/create_list.dart';
import 'package:gennis_innovative_school/network/network.dart';
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

  late Date day;
  late Date month;

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
            margin: const EdgeInsets.only(top: 2),
              child: GetBuilder<CreateController>(
                init: CreateController(),
                builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            ListView.builder(
                              itemCount: controller.listOfStudents.length,
                              itemBuilder: (context, index) {
                                final student = controller
                                    .listOfStudents[index];
                                // return Card(
                                //   color: Colors.cyanAccent,
                                //   child: SizedBox(
                                //     height: 65,
                                //     child: CheckboxListTile(
                                //       subtitle: Text(
                                //         student.surname ?? '',
                                //         style: const TextStyle(
                                //             color: Colors.black,
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 16),),
                                //       title: Text(
                                //         student.name ??
                                //             '', style: const TextStyle(
                                //           color: Colors.black,
                                //           fontWeight: FontWeight.bold,
                                //           fontSize: 16),),
                                //       value: controller.listOfStudents[index].typeChecked=='no',
                                //       onChanged: (bool? value){
                                //         setState(() {
                                //           controller.listOfStudents[index].typeChecked = (value ?? false) as String?;
                                //         });
                                //       }
                                //     ),
                                //   ),
                                // );
                               return listOfUsers(controller, index);
                              },
                            ),
                            controller.isLoading
                                ? const Center(
                                child: CircularProgressIndicator())
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      // submitButton(controller.students as CreateController,day,month)
                    ],
                  );
                },
              ),
            ),
          ),
        );
  }
}
// import 'package:flutter/material.dart';
//
// class CheckboxList extends StatefulWidget {
//   @override
//   _CheckboxListState createState() => _CheckboxListState();
// }
//
// class _CheckboxListState extends State<CheckboxList> {
//   List<String> _items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];
//
//   Map<String, bool> _checkedItems = {
//     'Item 1': false,
//     'Item 2': false,
//     'Item 3': false,
//     'Item 4': false,
//     'Item 5': false,
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkbox List'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _items.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final item = _items[index];
//                 return CheckboxListTile(
//                   title: Text(item),
//                   value: _checkedItems[item],
//                   onChanged: (bool value) {
//                     setState(() {
//                       _checkedItems[item] = value;
//                     });
//                   },
//                 );
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Perform some action based on selected items
//               List<String> selectedItems = [];
//               _checkedItems.forEach((key, value) {
//                 if (value) {
//                   selectedItems.add(key);
//                 }
//               });
//               print(selectedItems);
//             },
//             child: Text('Get Selected Items'),
//           ),
//         ],
//       ),
//     );
//   }
// }

  //sjdhjfjsdfjdjghdhgjf//
  // void toggleStudentSelection(Student student) {
  // student.isSelected = !student.isSelected;
  // setState(() {});
  // }
  //
  // void sendSelectedStudentsToServer() {
  // final selectedStudents = students.where((student) => student.isSelected).toList();
  // // Send selected students to the server using http.post or any other method you prefer.
  // // Your implementation here...
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  // return Scaffold(
  // appBar: AppBar(
  // title: Text('Select Students'),
  // ),
  // body: ListView.builder(
  // itemCount: students.length,
  // itemBuilder: (context, index) {
  // final student = students[index];
  // return CheckboxListTile(
  // title: Text(student.name),
  // value: student.isSelected,
  // onChanged: (_) => toggleStudentSelection(student),
  // );
  // },
  // ),
  // floatingActionButton: FloatingActionButton(
  // onPressed: sendSelectedStudentsToServer,
  // child: Icon(Icons.send),
  // ),
  // );
  // }
  // }

  //sjdhjfjsdfjdjghdhgjf//

// class _MyHomePageState extends State<MyHomePage> {
//   List<Student> students = [
//     Student(1, 'John'),
//     Student(2, 'Alice'),
//     Student(3, 'Bob'),
//     Student(4, 'Jane'),
//   ];
//
//   List<int> selectedStudents = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student List'),
//       ),
//       body: ListView.builder(
//         itemCount: students.length,
//         itemBuilder: (context, index) {
//           return CheckboxListTile(
//             title: Text(students[index].name),
//             value: selectedStudents.contains(students[index].id),
//             onChanged: (bool isChecked) {
//               setState(() {
//                 if (isChecked) {
//                   selectedStudents.add(students[index].id);
//                 } else {
//                   selectedStudents.remove(students[index].id);
//                 }
//               });
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           sendSelectedStudentsToServer();
//         },
//         child: Icon(Icons.send),
//       ),
//     );
//   }
//
//   void sendSelectedStudentsToServer() async {
//     // Send the selectedStudents list to the server using http package
//     // For simplicity, we will just print the selected student ids here
//     print(selectedStudents);
//   }
// }}
