import 'package:flutter/material.dart';
import '../../../../controller/chirchik_list.dart';
import '../../../../pages/profilePage/morePage/model/teachers_salary.dart';

Widget teachersSalary (DataOfTeachersSalary dataOfTeachersSalary){
  return Container(
    color: Colors.white,
    height: 58,
    width: double.infinity,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 6.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(dataOfTeachersSalary.date.toString(),style: const TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
              Text(dataOfTeachersSalary.residue.toString(),style: const TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
              Text(dataOfTeachersSalary.takenSalary.toString(),style: const TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
              Text(dataOfTeachersSalary.salary.toString(),style: const TextStyle(color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),),
            ],
          ),
          const Divider(thickness: 1.0,)
        ],
      ),
    ),
  );
}