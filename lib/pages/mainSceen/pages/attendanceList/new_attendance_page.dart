import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gennis_innovative_school/model/fake_user2.dart';

class AttendanceCheckOut extends StatefulWidget {
  const AttendanceCheckOut({Key? key}) : super(key: key);
  static const String id = "attendanceCheckOut";
  @override
  State<AttendanceCheckOut> createState() => _AttendanceCheckOutState();
}

class _AttendanceCheckOutState extends State<AttendanceCheckOut> {

  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C2FF),
        title: Row(
          children: const [
            Text("Date:",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(width: 10,),
            Text("07.05.2023 ",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: ListView(
        children: [
          _listOfStudents(price: "350.000",name: 'Alisher',lastname: 'Daminov'),
          _listOfStudents(price: "350.000",name: 'Alisher',lastname: 'Daminov'),
          _listOfStudents(price: "350.000",name: 'Alisher',lastname: 'Daminov'),
          _listOfStudents(price: "350.000",name: 'Alisher',lastname: 'Daminov'),
          _listOfStudents(price: "350.000",name: 'Alisher',lastname: 'Daminov'),
          _listOfStudents(price: "350.000",name: 'Alisher',lastname: 'Daminov'),
          _listOfStudents(price: "350.000",name: 'Alisher',lastname: 'Daminov'),
          _listOfStudents(price: "350.000",name: 'Alisher',lastname: 'Daminov'),
          _listOfStudents(price: "350.000",name: 'Alisher',lastname: 'Daminov'),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: list.length,
      //     itemBuilder: (BuildContext context,int index){
      //     return _listOfStudents(list[index]);
      //     }
      // ),
    );
  }
  Widget _listOfStudents({price,name,lastname}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //#students list and checked out
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height: 50,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                    Row(
             children: const [
               Text("Alisher",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),) ,
               SizedBox(width: 10,),
               Text("Daminov",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),) ,
             ],
           ),
                isChecked ?  const Center(
                  child: Icon(Icons.check,color: Colors.green,size: 40,),)
                    : const Center(
                              child: Icon(Icons.close_sharp,color: Colors.red,size: 40,),
                ),
              ],
            ),
        ),
        const Divider(thickness: 1,)
      ],
    );
}
}
