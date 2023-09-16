import 'package:flutter/material.dart';

class AttendanceCheckOut extends StatefulWidget {
  const AttendanceCheckOut({Key? key}) : super(key: key);
  static const String id = "attendanceCheckOut";

  @override
  State<AttendanceCheckOut> createState() => _AttendanceCheckOutState();
}

class _AttendanceCheckOutState extends State<AttendanceCheckOut> {
  var isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C2FF),
        title: Row(
          children: const [
            Text("Date:", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(width: 10,),
            Text("07.05.2023 ", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: ListView(
        children: [
          _listOfStudents(),
          _listOfStudents(),
          _listOfStudents()
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

  Widget _listOfStudents() {
    return Container(
      height: 75,
      width: double.infinity,
      color: Colors.white,
      child: Center(
          child: Card(color: Colors.cyanAccent,
           child: Center(child: ListTile(
            title: const Text("Alisher", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),overflow: TextOverflow.ellipsis),
            subtitle:const Text("Daminov", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),overflow: TextOverflow.ellipsis,),
            trailing: SizedBox(
              height: 41,
              width: 41,
              child: isChecked
                  ? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0), color: Colors.green),
                    child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                  )
                  :  Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0), color: Colors.red),
                      child: const Icon(
                        Icons.close_sharp,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
            ),
          ),
        ),
      )),
    );
  }
}
