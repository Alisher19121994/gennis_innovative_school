import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/mainSceen/pages/attendanceList/new_attendance_page.dart';
//#students attendances with dateTime in this _listOfStudentsCheckOut
Widget listOfStudentsCheckOut(BuildContext context,) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>const AttendanceCheckOut()));
    },
    child: Container(
      height: 400,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:  const Color(0xFFE1E8ED),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 3.0,vertical: 3.0),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('09.09.2023',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    child:Text('12',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),)
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
                    child:Text('1',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),)
                ),
              ),
            ],
          ),
          const Text('Attendances',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),


        ],
      ),

    ),
  );
}