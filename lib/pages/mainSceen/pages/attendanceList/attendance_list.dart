import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/model/fake_user2.dart';

import 'new_attendance_page.dart';


class AttendanceList extends StatefulWidget {
  final int ids;
  const AttendanceList({Key? key, required this.ids}) : super(key: key);
  static const String id = "attendanceList";

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:GridView.count(
        crossAxisCount: 3,
        children: [
          _listOfStudentsCheckOut(date: '07.04.2023',yes: '12',no: '2'),
          _listOfStudentsCheckOut(date: '07.04.2023',yes: '11',no: '3'),
          _listOfStudentsCheckOut(date: '07.04.2023',yes: '14',no: '0'),
          _listOfStudentsCheckOut(date: '07.04.2023',yes: '12',no: '2'),
          _listOfStudentsCheckOut(date: '07.04.2023',yes: '11',no: '3'),
          _listOfStudentsCheckOut(date: '07.04.2023',yes: '14',no: '0'),
          _listOfStudentsCheckOut(date: '07.04.2023',yes: '12',no: '2'),
          _listOfStudentsCheckOut(date: '07.04.2023',yes: '11',no: '3'),
          _listOfStudentsCheckOut(date: '07.04.2023',yes: '14',no: '8'),

        ],
      )
    );
  }

  //#students attendances with dateTime in this _listOfStudentsCheckOut
  Widget _listOfStudentsCheckOut({date,yes,no}) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AttendanceCheckOut.id);
      },
      child: Container(
        height: 400,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black26
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(date,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              //#students available in the schedule
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.green
                ),
                child: Center(
                    child:Text(yes,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),)
                ),
              ),
              const SizedBox(width: 10,),
              //#students absence in the schedule
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.red
                ),
                child: Center(
                    child:Text(no,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),)
                ),
              ),
            ],
          ),
        ),

          ],
        ),

      ),
    );
  }
}
