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
  // static const String baseUrl = "http://176.96.243.55/api/";
  // var isLoading = false;
  // var isChecked = false;
  // var logger = Logger();
  // List<Students> studentsOfListChecked = [];


  @override
  void initState() {
    super.initState();
    Get.find<CreateController>().apiListOfStudents(widget.ids);
    //_fetchData();
    //getData('group_profile',"${widget.ids}");
    //Dio().interceptors.add(ChuckerDioInterceptor());
  }

    //  Future<http.Response> getData(String api,String id) async {
    //    setState(() {
    //      isLoading = true;
    //    });
    //   final accessToken = SharedPreferenceData.getToken();
    //   final response = await http.get(
    //     Uri.parse("$baseUrl$api/$id"),
    //     headers: {"Authorization": "Bearer $accessToken"},
    //   );
    //
    //   if (response.statusCode == 401) {
    //     var logger = Logger();
    //     final newAccessToken = await getNewAccessToken();
    //     final newResponse = await http.get(
    //       Uri.parse("$baseUrl$api"),
    //       headers: {"Authorization": "Bearer $newAccessToken"},
    //     );
    //     final Map<String, dynamic> body = jsonDecode(newAccessToken.body);
    //     final UserList usersList = UserList.fromJson(body);
    //     logger.d(body);
    //     setState(() {
    //       studentsOfListChecked = usersList.data!.students!;
    //       isLoading = false;
    //     });
    //     return newResponse;
    //   } else {
    //     return response;
    //   }
    // }
    //
    //  Future getNewAccessToken() async {
    //   var userData = SharedPreferenceData.getUsername();
    //   var passwordData = SharedPreferenceData.getPassword();
    //   final response = await http.post(
    //     Uri.parse("$baseUrl/login"),
    //     body: {
    //       "username": userData,
    //       "password": passwordData,
    //     },
    //   );
    //
    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body);
    //     return data;
    //   } else {
    //     throw Exception("Failed to get new access token");
    //   }
    // }

  // void _fetchData() async {
  //   final chuckerHttpClient = ChuckerHttpClient(http.Client());
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var logger = Logger();
  //   var token = await SharedPreferenceData.getToken();
  //   final response = await chuckerHttpClient.get(
  //       Uri.parse('http://176.96.243.55/api/group_profile/${widget.ids}'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       });
  //   final Map<String, dynamic> body = jsonDecode(response.body.toString());
  //   final UserList usersList = UserList.fromJson(body);
  //
  //   logger.i(body);
  //   setState(() {
  //     studentsOfListChecked = usersList.data!.students!;
  //     isLoading = false;
  //   });
  // }
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
                  const SizedBox(height: 2,),
                  //List of students
                  Expanded(
                    child: GetBuilder<CreateController>(
                      init: CreateController(),
                      builder: (_controller){
                        return Stack(
                          children: [
                            ListView.builder(
                              itemCount: _controller.listOfStudents.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  borderOnForeground: true,
                                  color: Colors.cyanAccent,
                                  child: ListTile(
                                    leading:  Text(_controller.listOfStudents[index].surname ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                    title: Text(_controller.listOfStudents[index].name ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                    trailing: Transform.scale(
                                      scale: 2.2,
                                      child: Checkbox(
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        value: _controller.listOfStudents[index].isTypeChecked,
                                        onChanged: (value) {
                                          setState(() {
                                            _controller.listOfStudents[index].isTypeChecked = value;
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
                           _controller.isLoading
                                ? const Center(child: CircularProgressIndicator())
                                : const SizedBox.shrink()
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  )
                ],
              )
            //   :const SizedBox.shrink()
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
