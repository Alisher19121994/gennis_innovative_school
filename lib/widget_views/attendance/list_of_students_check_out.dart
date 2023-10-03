import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/mainSceen/pages/attendanceList/model/attandances/attandance_group_gridview.dart';
import '../../pages/mainSceen/pages/attendanceList/new_attendance_page.dart';
//#students attendances with dateTime in this _listOfStudentsCheckOut
Widget listOfStudentsCheckOut(BuildContext context,AttendanceInfo attendanceInfo,int id) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=> AttendanceCheckOut(date: attendanceInfo.day.toString(),ids:id)));
    },
    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:  const Color(0xFFE1E8ED),
      ),
       margin: const EdgeInsets.symmetric(horizontal: 1.0,vertical: 1.0),
       padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(attendanceInfo.day.toString(),style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),
          const SizedBox(height: 3.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //#students available in the schedule
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.green
                ),
                child: Center(
                    child:Text(attendanceInfo.present.toString(),style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),)
                ),
              ),
              const SizedBox(width: 14.0,),
              //#students absence in the schedule
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.red
                ),
                child: Center(
                    child:Text(attendanceInfo.absent.toString(),style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),)
                ),
              ),
            ],
          ),
          const SizedBox(height: 3.0,),
          const Text('Attendances',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),


        ],
      ),

    ),
  );
}