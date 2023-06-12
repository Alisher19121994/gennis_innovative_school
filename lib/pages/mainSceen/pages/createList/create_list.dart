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
  var isSelectedChecked = true;
  var isSelectedUnChecked = false;

  bool isChecked = false;

  var isLoading = false;
  var logger = Logger();
  List<Students> listOfUsers = [];
  List<Students> list = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    Dio().interceptors.add(ChuckerDioInterceptor());
  }

  void fetchData() async {
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
      listOfUsers = usersList.data!.students!;
      isLoading = false;

    });
    setState(() {
      isChecked = false;
      //isChecked = false;
    });
  }

  Future<String?> ratingUser(Students students) async {
    final response = await http.post(
      Uri.parse('http://176.96.243.55/api/make_attendance'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'isTypeChecked': students.isTypeChecked,
      }),
    );
    var logger = Logger();
    if (response.statusCode == 200) {
      logger.i(response.body);
      return response.body;
    } else {
      return null;
    }
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
                                //  _listOfStudents();
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
                  const SizedBox(
                    height: 2,
                  ),
                  //List of students
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                          itemCount: listOfUsers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _listOfStudents(listOfUsers[index]);
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

  //#fullname of student,ratings checked points,available students
  Widget _listOfStudents(Students students) {
    return Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //#fullname of student
                SizedBox(
                  width: 110,
                  child: Column(
                    children: [
                      Text(
                        students.surname ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        students.name ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 1,
                ),
                //#checked points and available students
                Expanded(
                    child: Column(
                  children: [
                    //#ratings checked points
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //#point title
                            Container(
                              height: 38,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.cyanAccent),
                              child: const Center(
                                child: Text(
                                  "Point",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            //#ratings checked points
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 0.7),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                // value = rating;
                                print(rating.toInt());
                                // Rating rating = Rating(rating);
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    //#available students
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //#checked title in the table
                        Container(
                          height: 38,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.cyanAccent),
                          child: const Center(
                            child: Text(
                              "Check",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ),
                        ),

                        Container(
                          color: Colors.cyan,
                          height: 46,
                          width: 76,
                          child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _checkedBox(list[index]);
                          },
                        ),
                        ),



                        SizedBox(
                          height: 46,
                          width: 76,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                //isChecked = !isChecked;
                                isChecked = false;
                              });
                            },
                            selected: isChecked,
                            selectedColor: Colors.red,
                            title: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: isChecked ? Colors.red : Colors.grey,),
                              child: const Center(
                                child: Icon(
                                  Icons.close_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1,
            )
          ],
        ));
  }

  Widget _checkedBox(Students students){
    return Container(
        height: 46,
        width: 76);

      //       color: Colors.cyanAccent,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(7),
      //        color: students.isTypeChecked! ? Colors.green : Colors.grey,),
      //       // // child: const Center(
      //       // //   child: Icon(Icons.check, size: 30, color: Colors.white,),
      //
      // child: Checkbox(
      //   value: students.isTypeChecked,
      //   onChanged: (value) {
      //     setState(() {
      //       students.isTypeChecked = value;
      //     });
      //   },
      // ),


    // return   SizedBox(
    //   height: 46,
    //   width: 76,
    //   child: ListTile(
    //     onTap: () {
    //       setState(() {
    //         //isChecked = !isChecked;
    //         students.isTypeChecked = false;
    //       });
    //     },
    //     selected: students.isTypeChecked??false,
    //     selectedColor: Colors.green,
    //     title: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(7),
    //         color: students.isTypeChecked! ? Colors.green : Colors.grey,),
    //       child: const Center(
    //         child: Icon(Icons.check, size: 30, color: Colors.white,),
    //       ),
    //     ),
    //   ),
    // );
  }}

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
