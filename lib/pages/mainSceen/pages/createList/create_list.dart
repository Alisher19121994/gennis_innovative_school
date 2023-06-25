import 'dart:convert';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gennis_innovative_school/controller/create_list.dart';
import 'package:gennis_innovative_school/network/network.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../../../widget_views/check_page/create_of_users.dart';
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
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(top: 2),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //List of students
                  Expanded(
                    child: GetBuilder<CreateController>(
                      init: CreateController(),
                      builder: (controller){
                        return Stack(
                          children: [
                            ListView.builder(
                              itemCount: controller.listOfStudents.length,
                              itemBuilder: (context, index) {
                              //  return listOfUsers(controller,index);
                                return Card(
                                  borderOnForeground: true,
                                  color: Colors.cyanAccent,
                                  child: ListTile(
                                    leading:  Text(controller.listOfStudents[index].surname ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                    title: Text(controller.listOfStudents[index].name ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                    trailing: Transform.scale(
                                      scale: 2.2,
                                      child: Checkbox(
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: controller.listOfStudents[index].isTypeChecked,
                                        onChanged: (value) {
                                           setState(() {
                                          controller.listOfStudents[index].isTypeChecked = value;
                                           });
                                        },
                                        checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),

                                        tristate: true,
                                      ),
                                    ),

                                  ),
                                );
                              },
                            ),
                           controller.isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox.shrink()
                          ],
                        );
                      },
                    ),
                  ),
                  //#submit button
                  Container(
                      height: 80,
                      color: Colors.cyanAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 20,),
                          SizedBox(
                            height: 100,
                            child: ScrollDatePicker(
                              selectedDate: _selectedDate,
                              locale: const Locale('en'),
                              scrollViewOptions: const DatePickerScrollViewOptions(
                                year: ScrollViewDetailOptions(margin: EdgeInsets.only(right: 8),),
                                month: ScrollViewDetailOptions(margin: EdgeInsets.only(right: 8),),),
                              onDateTimeChanged: (DateTime value) {
                                setState(() {
                                  _selectedDate = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 70,),
                          //#submit button
                          Expanded(
                            child: SizedBox(
                              height: 55,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () {
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
                                  List<String> selectedItems = [];
                                  // _checkedItems.forEach((key, value) {
                                  // if (value) {
                                  //  selectedItems.add(key);
                                  //         }});
                                  setState(() {
                                    _selectedDate = DateTime.now();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlueAccent,
                                    side: const BorderSide(
                                        width: 2, color: Colors.white)),
                                child: const Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              )
          ),
        ));
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
}
