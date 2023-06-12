import 'dart:convert';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:drop_down_list_menu/drop_down_list_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import '../mainSceen/pages/usersList/model/users.dart';

class GroupPage extends StatefulWidget {
  final int getGroupId;
  const GroupPage({Key? key, required this.getGroupId}) : super(key: key);

  static const String id = "groupPage";

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {

  var isPaid = true;
  bool isChecked = false;
  List list = [];

  List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];


  Students students= Students();
  UserList usersList = UserList();
  List<Students> listOfUsers = [];
  final Map<String, dynamic> _checkedItems = {
    'listOfUsers.first.isTypeChecked ??''': false,
  };
  @override
  void initState() {
    super.initState();
    fetchData();
    Dio().interceptors.add(ChuckerDioInterceptor());
  }

  void fetchData()async{
    final chuckerHttpClient = ChuckerHttpClient(http.Client());
    var logger = Logger();
    var token = await SharedPreferenceData.getToken();
    final response = await chuckerHttpClient.get(
        Uri.parse('http://176.96.243.55/api/group_profile/${widget.getGroupId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );
    final Map<String,dynamic> body = jsonDecode(response.body);
    final UserList userList = UserList.fromJson(body);

    logger.i(body);

    setState(() {
      isPaid == true;
      listOfUsers = userList as List<Students>;
    });


    if(students.money! > 0 ){
      setState(() {
        isPaid == true;
      });
    }else{
      setState(() {
        isPaid == false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: const Color(0xFF00C2FF),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            const Text('Group details', style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold),),
            //#Group details
          //   Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(17),
          //       color: Colors.cyanAccent),
          //   margin: const EdgeInsets.all(6),
          //   padding: const EdgeInsets.all(16),
          //   height: 270,
          //   child: Column(
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Text(
          //             "Educational language",
          //             style: TextStyle(color: Colors.black,
          //                 fontSize: 17,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             usersList.data?.information?.eduLang?.value??"",
          //             style: const TextStyle(color: Colors.black, fontSize: 17),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Text(
          //             "Course type",
          //             style: TextStyle(color: Colors.black,
          //                 fontSize: 17,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             usersList.data?.information?.groupCourseType?.value??"",
          //             style: const TextStyle(color: Colors.black, fontSize: 17),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Text(
          //             "Group's name",
          //             style: TextStyle(color: Colors.black,
          //                 fontSize: 17,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             usersList.data?.information?.groupName?.value??"",
          //             style: const TextStyle(color: Colors.black, fontSize: 17),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Text(
          //             "Group's price",
          //             style: TextStyle(color: Colors.black,
          //                 fontSize: 17,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             usersList.data?.information?.groupPrice?.value.toString()??"",
          //             style: const TextStyle(color: Colors.black, fontSize: 17),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Text(
          //             "Student's number",
          //             style: TextStyle(color: Colors.black,
          //                 fontSize: 17,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             usersList.data?.information?.studentsLength?.value.toString()??"",
          //             style: const TextStyle(color: Colors.black, fontSize: 17),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Text(
          //             "Teacher's name",
          //             style: TextStyle(color: Colors.black,
          //                 fontSize: 17,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //           usersList.data?.information?.teacherName?.value??"",
          //             style: const TextStyle(color: Colors.black, fontSize: 17),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Text(
          //             "Teacher's lastName",
          //             style: TextStyle(color: Colors.black,
          //                 fontSize: 17,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             usersList.data?.information?.teacherSurname?.value??"",
          //             style: const TextStyle(color: Colors.black, fontSize: 17),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Text(
          //             "Holder",
          //             style: TextStyle(color: Colors.black,
          //                 fontSize: 17,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Text(
          //             usersList.data?.information?.teacherSalary?.value?.toString()??"",
          //             style: const TextStyle(color: Colors.black, fontSize: 17),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
            _groupOfDetails(students),
            const SizedBox(height: 14,),
            const Text('Point list', style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold),),
            const SizedBox(height: 4,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.cyanAccent),
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(16),
              height: 520,
              child: ListView.builder(
                itemCount: listOfUsers.length,
                itemBuilder: (context,index){
                  // return Card(
                  //   margin: const EdgeInsets.symmetric(vertical: 0.7),
                  //   color: Colors.cyanAccent,
                  //   child: Slidable(
                  //     enabled: true,
                  //     direction: Axis.horizontal,
                  //     closeOnScroll: true,
                  //     startActionPane: ActionPane(
                  //       extentRatio: 0.50,
                  //       motion: const ScrollMotion(),
                  //       children: [
                  //         isPaid
                  //             ? SlidableAction(
                  //           onPressed: (BuildContext context) {},
                  //           flex: 1,
                  //           backgroundColor: Colors.green,
                  //           //label: '350.000',
                  //            label: students.money.toString(),
                  //         )
                  //             : SlidableAction(
                  //           onPressed: (BuildContext context) {},
                  //           flex: 2,
                  //           backgroundColor: Colors.red,
                  //          // label: '-350.000',
                  //           label: students.money.toString(),
                  //           borderRadius: BorderRadius.circular(14),
                  //         ),
                  //       ],
                  //     ),
                  //     // child: ListTile(
                  //     //   leading: const CircleAvatar(radius: 25, backgroundImage: AssetImage(ProjectImages.mue),),
                  //     //   title: const Text('Alisher',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                  //     //   subtitle: const Text('Daminov',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                  //     //   trailing: RatingBar.builder(
                  //     //     initialRating: 0,
                  //     //     minRating: 1,
                  //     //     direction: Axis.horizontal,
                  //     //     itemCount: 5,
                  //     //     itemSize: 33,
                  //     //     itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
                  //     //     itemBuilder: (context, _) => const Icon(
                  //     //       Icons.star,
                  //     //       color: Colors.amber,
                  //     //     ),
                  //     //     onRatingUpdate: (rating) {
                  //     //       // value = rating;
                  //     //       print(rating.toInt());
                  //     //       // Rating rating = Rating(rating);
                  //     //     },
                  //     //   )
                  //     // //   trailing: ListTile(
                  //     // //     leading: SizedBox(
                  //     // //   //height: 400,
                  //     // //   //width: double.infinity,
                  //     // //   //child:_listOfUsersCheck(),
                  //     // //   // child: ListView(
                  //     // //   //   children: [
                  //     // //   //     _listOfUsersCheck(),
                  //     // //   //     _listOfUsersCheck(),
                  //     // //   //   ],
                  //     // //   // ),
                  //     //   child: ListView.builder(
                  //     //   itemCount: _items.length,
                  //     //     itemBuilder: (BuildContext context, int index) {
                  //     //       final item = _items[index];
                  //     //       return CheckboxListTile(
                  //     //         title: Text(item),
                  //     //         value: _checkedItems[item],
                  //     //         onChanged: (bool? value){
                  //     //           setState(() {
                  //     //             _checkedItems[item] = value?? false;
                  //     //           });
                  //     //         },
                  //     //       );
                  //     //     },
                  //     //   ),
                  //     // ),
                  //     // //     trailing:  RatingBar.builder(
                  //     // //       initialRating: 0,
                  //     // //       minRating: 1,
                  //     // //       direction: Axis.horizontal,
                  //     // //       itemCount: 5,
                  //     // //       itemSize: 33,
                  //     // //       itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
                  //     // //       itemBuilder: (context, _) => const Icon(
                  //     // //         Icons.star,
                  //     // //         color: Colors.amber,
                  //     // //       ),
                  //     // //       onRatingUpdate: (rating) {
                  //     // //         // value = rating;
                  //     // //         print(rating.toInt());
                  //     // //         // Rating rating = Rating(rating);
                  //     // //       },
                  //     // //     ),
                  //     // //       ),
                  //     //   ),
                  //     child: ListTile(
                  //       leading:CircleAvatar(radius: 25, backgroundImage: NetworkImage(students.photoProfile??''),),
                  //       title: Row(
                  //         children: [
                  //           const SizedBox(width: 7,),
                  //           // Column(
                  //           //   children: [
                  //           //        Text(students.name??'',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                  //           //        Text(students.surname??'',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                  //           //   ],
                  //           // ),
                  //          // const SizedBox(width: 4,),
                  //           //#CheckboxListTile
                  //           Container(
                  //          //   height: 40,
                  //             child: ListView.builder(
                  //             itemCount: listOfUsers.length,
                  //               itemBuilder: (BuildContext context, int index) {
                  //                 final item = listOfUsers[index];
                  //                 return CheckboxListTile(
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(10),
                  //                   ),
                  //                   checkColor: Colors.lightBlue,
                  //                   title: Text(item.name??''),
                  //                   subtitle:  Text(item.surname??''),
                  //                   value: _checkedItems[item],
                  //                   onChanged: (bool? value){
                  //                     setState(() {
                  //                       //_checkedItems[item] = value?? false;
                  //                     });
                  //                   },
                  //                 );
                  //               },
                  //             ),
                  //           ),
                  //           const SizedBox(width: 3,),
                  //           //#RatingBar
                  //           Expanded(
                  //             child: Row(
                  //               children: [
                  //                 // Container(
                  //                 //   height: 90,
                  //                 //   child: ListView.builder(
                  //                 //     itemCount: _items.length,
                  //                 //     itemBuilder: (BuildContext context, int index) {
                  //                 //       final item = _items[index];
                  //                 //       return CheckboxListTile(
                  //                 //         title: Text(item),
                  //                 //         value: _checkedItems[item],
                  //                 //         onChanged: (bool? value){
                  //                 //           setState(() {
                  //                 //             _checkedItems[item] = value?? false;
                  //                 //           });
                  //                 //         },
                  //                 //       );
                  //                 //     },
                  //                 //   ),
                  //                 // ),
                  //                 //  CheckboxListTile(
                  //                 //  title: Column(
                  //                 //   children: [
                  //                 //     const Text('Alisher',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                  //                 //     const Text('Daminov',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                  //                 //   ],
                  //                 // ),
                  //                 //  // value: _checkedItems[_items],
                  //                 //  // onChanged: (bool? value){
                  //                 //  //  setState(() {
                  //                 //  //    _checkedItems[_items] = value ?? false;
                  //                 //  //  });
                  //                 //  // },
                  //                 //     ),
                  //                 Expanded(
                  //                     child:  RatingBar.builder(
                  //                       initialRating: 0,
                  //                       minRating: 1,
                  //                       direction: Axis.horizontal,
                  //                       itemCount: 5,
                  //                       itemSize: 33,
                  //                       itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
                  //                       itemBuilder: (context, _) => const Icon(
                  //                         Icons.star,
                  //                         color: Colors.amber,
                  //                       ),
                  //                       onRatingUpdate: (rating) {
                  //                         // value = rating;
                  //                         print(rating.toInt());
                  //                         // Rating rating = Rating(rating);
                  //                       },
                  //                     )
                  //                 )
                  //               ],
                  //             ),
                  //             // child: RatingBar.builder(
                  //             //   initialRating: 0,
                  //             //   minRating: 1,
                  //             //   direction: Axis.horizontal,
                  //             //   itemCount: 5,
                  //             //   itemSize: 33,
                  //             //   itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
                  //             //   itemBuilder: (context, _) => const Icon(
                  //             //     Icons.star,
                  //             //     color: Colors.amber,
                  //             //   ),
                  //             //   onRatingUpdate: (rating) {
                  //             //     // value = rating;
                  //             //     print(rating.toInt());
                  //             //     // Rating rating = Rating(rating);
                  //             //   },
                  //             // )
                  //
                  //           ),
                  //
                  //         ],
                  //       ),
                  //
                  //     ),
                  //   ),
                  //
                  //
                  // );
                  //#######################
                  // final item = listOfUsers[index];
                  // return ListTile(
                  //   leading: CircleAvatar(radius: 50,backgroundImage: NetworkImage(students.photoProfile??''),),
                  //   title: CheckboxListTile(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     checkColor: Colors.lightBlue,
                  //     title: Text(item.name??''),
                  //     subtitle:  Text(item.surname??''),
                  //     value: _checkedItems[item],
                  //     onChanged: (bool? value){
                  //       setState(() {
                  //         //_checkedItems[item] = value?? false;
                  //       });
                  //     },
                  //   ),
                  // );
                },
              ),
              // child: ListView(
              //   children: [
              //     _listOfUsers(),
              //     _listOfUsers(),
              //     _listOfUsers(),
              //     _listOfUsers(),
              //     _listOfUsers(),
              //     _listOfUsers(),
              //     _listOfUsers(),
              //     _listOfUsers(),
              //     _listOfUsers(),
              //     _listOfUsers(),
              //   ],
              // ),
            ),
            ///////////////////////
           //  const SizedBox(height: 14,),
           //  const Text('Check list', style: TextStyle(
           //      color: Colors.black,
           //      fontSize: 24,
           //      fontWeight: FontWeight.bold),),
           // const SizedBox(height: 4,),
           //  SizedBox(
           //    height: 400,
           //    width: double.infinity,
           //    //child:_listOfUsersCheck(),
           //    // child: ListView(
           //    //   children: [
           //    //     _listOfUsersCheck(),
           //    //     _listOfUsersCheck(),
           //    //   ],
           //    // ),
           //    child: ListView.builder(
           //      itemCount: _items.length,
           //      itemBuilder: (BuildContext context, int index) {
           //        final item = _items[index];
           //        return CheckboxListTile(
           //          title: Text(item),
           //          value: _checkedItems[item],
           //          onChanged: (bool? value){
           //            setState(() {
           //              _checkedItems[item] = value?? false;
           //            });
           //          },
           //        );
           //      },
           //    ),
           //  ),
           //  const SizedBox(height: 14,),
            //#submit button
            Container(
              height: 50,
              width: 300,
              color:const Color(0xFF00C2FF),
              child:OutlinedButton(
                onPressed: (){
                  List<String> selectedItems = [];
                  _checkedItems.forEach((key, value) {
                      if (value) {
                        selectedItems.add(key);}});
                      },
                child: const Text('Submit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
              ),
            ),
            const SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }

  Widget _groupOfDetails(Students students) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Colors.cyanAccent),
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(16),
      height: 270,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Educational language",
                style: TextStyle(color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
               usersList.data?.information?.eduLang?.value??"",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Course type",
                style: TextStyle(color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                usersList.data?.information?.groupCourseType?.value??"",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Group's name",
                style: TextStyle(color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
              usersList.data?.information?.groupName?.value??"",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Group's price",
                style: TextStyle(color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                usersList.data?.information?.groupPrice?.value.toString()??"",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Student's number",
                style: TextStyle(color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
              usersList.data?.information?.studentsLength?.value.toString()??"",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Teacher's name",
                style: TextStyle(color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                usersList.data?.information?.teacherName?.value??"",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Teacher's lastName",
                style: TextStyle(color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
            usersList.data?.information?.teacherSurname?.value??"",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Holder",
                style: TextStyle(color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                usersList.data?.information?.teacherSalary?.value?.toString()??"",
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _listOfUsers(Students students) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 0.7),
      color: Colors.cyanAccent,
      child: Slidable(
          enabled: true,
          direction: Axis.horizontal,
          closeOnScroll: true,
          startActionPane: ActionPane(
            extentRatio: 0.50,
            motion: const ScrollMotion(),
            children: [
              isPaid
                  ? SlidableAction(
                onPressed: (BuildContext context) {},
                flex: 1,
                backgroundColor: Colors.green,
                label: '350.000',
                // label: students.money.toString(),
              )
                  : SlidableAction(
                onPressed: (BuildContext context) {},
                flex: 2,
                backgroundColor: Colors.red,
                label: '-350.000',
                //label: students.money.toString(),
                borderRadius: BorderRadius.circular(14),
              ),
            ],
          ),
            // child: ListTile(
            //   leading: const CircleAvatar(radius: 25, backgroundImage: AssetImage(ProjectImages.mue),),
            //   title: const Text('Alisher',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
            //   subtitle: const Text('Daminov',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
            //   trailing: RatingBar.builder(
            //     initialRating: 0,
            //     minRating: 1,
            //     direction: Axis.horizontal,
            //     itemCount: 5,
            //     itemSize: 33,
            //     itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
            //     itemBuilder: (context, _) => const Icon(
            //       Icons.star,
            //       color: Colors.amber,
            //     ),
            //     onRatingUpdate: (rating) {
            //       // value = rating;
            //       print(rating.toInt());
            //       // Rating rating = Rating(rating);
            //     },
            //   )
            // //   trailing: ListTile(
            // //     leading: SizedBox(
            // //   //height: 400,
            // //   //width: double.infinity,
            // //   //child:_listOfUsersCheck(),
            // //   // child: ListView(
            // //   //   children: [
            // //   //     _listOfUsersCheck(),
            // //   //     _listOfUsersCheck(),
            // //   //   ],
            // //   // ),
            //   child: ListView.builder(
            //   itemCount: _items.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       final item = _items[index];
            //       return CheckboxListTile(
            //         title: Text(item),
            //         value: _checkedItems[item],
            //         onChanged: (bool? value){
            //           setState(() {
            //             _checkedItems[item] = value?? false;
            //           });
            //         },
            //       );
            //     },
            //   ),
            // ),
            // //     trailing:  RatingBar.builder(
            // //       initialRating: 0,
            // //       minRating: 1,
            // //       direction: Axis.horizontal,
            // //       itemCount: 5,
            // //       itemSize: 33,
            // //       itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
            // //       itemBuilder: (context, _) => const Icon(
            // //         Icons.star,
            // //         color: Colors.amber,
            // //       ),
            // //       onRatingUpdate: (rating) {
            // //         // value = rating;
            // //         print(rating.toInt());
            // //         // Rating rating = Rating(rating);
            // //       },
            // //     ),
            // //       ),
            //   ),
             child: ListTile(
               onTap: (){

               },
               title: Row(
                   children: [
                     CircleAvatar(radius: 25, backgroundImage: NetworkImage(students.photoProfile??''),),
                     const SizedBox(width: 7,),
                     // Column(
                     //   children: [
                     //       const Text('Alisher',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                     //       const Text('Daminov',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                     //   ],
                     // ),
                    // const SizedBox(width: 4,),
                       // Container(
                       //   height: 40,
                       //   child: ListView.builder(
                       //   itemCount: _items.length,
                       //     itemBuilder: (BuildContext context, int index) {
                       //       final item = _items[index];
                       //       return CheckboxListTile(
                       //         title: Text(item),
                       //         value: _checkedItems[item],
                       //         onChanged: (bool? value){
                       //           setState(() {
                       //             _checkedItems[item] = value?? false;
                       //           });
                       //         },
                       //       );
                       //     },
                       //   ),
                       // ),
                     const SizedBox(width: 3,),
                     Expanded(
                       child: Row(
                         children: [
                           // Container(
                           //   height: 90,
                           //   child: ListView.builder(
                           //     itemCount: _items.length,
                           //     itemBuilder: (BuildContext context, int index) {
                           //       final item = _items[index];
                           //       return CheckboxListTile(
                           //         title: Text(item),
                           //         value: _checkedItems[item],
                           //         onChanged: (bool? value){
                           //           setState(() {
                           //             _checkedItems[item] = value?? false;
                           //           });
                           //         },
                           //       );
                           //     },
                           //   ),
                           // ),
                         //  CheckboxListTile(
                         //  title: Column(
                         //   children: [
                         //     const Text('Alisher',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                         //     const Text('Daminov',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
                         //   ],
                         // ),
                         //  // value: _checkedItems[_items],
                         //  // onChanged: (bool? value){
                         //  //  setState(() {
                         //  //    _checkedItems[_items] = value ?? false;
                         //  //  });
                         //  // },
                         //     ),
                          Expanded(
                              child:  RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 33,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
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
                          )
                         ],
                       ),
                         // child: RatingBar.builder(
                         //   initialRating: 0,
                         //   minRating: 1,
                         //   direction: Axis.horizontal,
                         //   itemCount: 5,
                         //   itemSize: 33,
                         //   itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
                         //   itemBuilder: (context, _) => const Icon(
                         //     Icons.star,
                         //     color: Colors.amber,
                         //   ),
                         //   onRatingUpdate: (rating) {
                         //     // value = rating;
                         //     print(rating.toInt());
                         //     // Rating rating = Rating(rating);
                         //   },
                         // )

                     ),

                   ],
                 ),

             ),
              ),


    );
    // return  ListTile(
    //   leading: CircleAvatar(radius: 50, backgroundImage: AssetImage(ProjectImages.mue),),
    //   title: Text('Alisher',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
    //   subtitle: Text('Daminov',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
    //   // trailing: isPaid ? Container(
    //   //   padding: const EdgeInsets.all(10),
    //   //   child: Text('350.000',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
    //   //   decoration: BoxDecoration(
    //   //       color: Colors.green,
    //   //       borderRadius: BorderRadius.circular(8)
    //   //   ),
    //   // ):
    //   // Container(
    //   //   padding: const EdgeInsets.all(10),
    //   //   child: Text('-350.000',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
    //   //   decoration: BoxDecoration(
    //   //       color: Colors.redAccent,
    //   //       borderRadius: BorderRadius.circular(8)
    //   //   ),
    //   // ),
    // );

  }

  // Widget _listOfUsersCheck() {
  //   return Card(
  //     margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 0.7),
  //     color: Colors.lightBlueAccent,
  //     child:  ListTile(
  //         leading: CircleAvatar(radius: 25, backgroundImage: AssetImage(ProjectImages.mue),),
  //         title: Text('Alisher',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
  //         subtitle: Text('Daminov',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
  //       //  trailing: ,
  //     ),
  //   );
  //   // return  ListTile(
  //   //   leading: CircleAvatar(radius: 50, backgroundImage: AssetImage(ProjectImages.mue),),
  //   //   title: Text('Alisher',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
  //   //   subtitle: Text('Daminov',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
  //   //   // trailing: isPaid ? Container(
  //   //   //   padding: const EdgeInsets.all(10),
  //   //   //   child: Text('350.000',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
  //   //   //   decoration: BoxDecoration(
  //   //   //       color: Colors.green,
  //   //   //       borderRadius: BorderRadius.circular(8)
  //   //   //   ),
  //   //   // ):
  //   //   // Container(
  //   //   //   padding: const EdgeInsets.all(10),
  //   //   //   child: Text('-350.000',style: TextStyle(color: Colors.black,fontSize: 19,fontWeight: FontWeight.bold),),
  //   //   //   decoration: BoxDecoration(
  //   //   //       color: Colors.redAccent,
  //   //   //       borderRadius: BorderRadius.circular(8)
  //   //   //   ),
  //   //   // ),
  //   // );
  //
  // }
}
