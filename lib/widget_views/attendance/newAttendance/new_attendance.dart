import 'package:flutter/material.dart';
import '../../../pages/mainSceen/pages/attendanceList/model/attandances/users_in_attandance_in_listVertical.dart';

Widget listOfStudents(NewAttendanceInfo attendanceInfo) {
  return Container(
    color: Colors.white,
    height: 65.0,
    width: double.infinity,
    child: Container(
      padding: const EdgeInsets.all(3.0),
      margin:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 14.0, right: 14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(attendanceInfo.student?.name ?? '',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    overflow: TextOverflow.ellipsis),
                const SizedBox(width: 6.0,),
                Text(
                  attendanceInfo.student?.surname ?? '',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(
              height: 27,
              width: 27,
              child: attendanceInfo.status == true
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: Colors.green),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 25,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: Colors.red),
                      child: const Icon(
                        Icons.close_sharp,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
            ),
          ]),
          const Divider(
            thickness: 1.0,
          )
        ],
      ),
    ),
  );
}
