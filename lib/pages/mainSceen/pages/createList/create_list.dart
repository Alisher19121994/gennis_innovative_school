import 'dart:convert';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../../../network/sharedPreferenceData/shared_preference_data.dart';
import '../usersList/model/users.dart';

class CreateList extends StatefulWidget {
  final int ids;

  const CreateList({Key? key, required this.ids}) : super(key: key);
  static const String id = "createList";

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {

  var isLoading = false;
  var logger = Logger();
  List<Students> studentsOfListChecked = [];


  @override
  void initState() {
    super.initState();
    _fetchData();
    Dio().interceptors.add(ChuckerDioInterceptor());
  }

  void _fetchData() async {
    final chuckerHttpClient = ChuckerHttpClient(http.Client());
    setState(() {
      isLoading = true;
    });
    var logger = Logger();
    var token = await SharedPreferenceData.getToken();
    final response = await chuckerHttpClient.get(
        Uri.parse('http://176.96.243.55/api/group_profile/${widget.ids}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
    final Map<String, dynamic> body = jsonDecode(response.body.toString());
    final UserList usersList = UserList.fromJson(body);

    logger.i(body);
    setState(() {
      studentsOfListChecked = usersList.data!.students!;
      isLoading = false;
    });
  }


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
                          SizedBox(
                            height: 55,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreenAccent,
                              ),
                              child: const Text(
                                "Date",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 55,
                            //width: double.infinity,
                            child: Center(
                              child: Text(
                                '04.2023',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 55,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                //  _listOfStudents()
                                List<String> selectedItems = [];
                                // _checkedItems.forEach((key, value) {
                                // if (value) {
                                //  selectedItems.add(key);
                                //         }});
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
                        ],
                      )),
                  const SizedBox(height: 2,),
                  //List of students
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                          itemCount: studentsOfListChecked.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.cyanAccent,
                              child: ListTile(
                                leading:  Text(studentsOfListChecked[index].surname ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                title: Text(studentsOfListChecked[index].name ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                                trailing: Checkbox(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  value: studentsOfListChecked[index].isTypeChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      studentsOfListChecked[index].isTypeChecked = value;
                                    });
                                  },
                                  activeColor: Colors.lightBlue,
                                    tristate: true,
                                ),

                              ),
                            );
                          },
                        ),
                        isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : const SizedBox.shrink()
                      ],
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
