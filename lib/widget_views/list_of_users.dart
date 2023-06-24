import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../controller/users_list.dart';

Widget listOfUsers(UserListController userListController) {
  return Slidable(
    enabled: true,
    direction: Axis.horizontal,
    closeOnScroll: true,
    endActionPane: ActionPane(
      extentRatio: 0.30,
      motion: const ScrollMotion(),
      children: [
        userListController.isPaid
            ? SlidableAction(
          onPressed: (BuildContext context) {},
          flex: 3,
          backgroundColor: Colors.green,
          label: userListController.students.money.toString(),
        )
            : SlidableAction(
          onPressed: (BuildContext context) {},
          flex: 3,
          backgroundColor: Colors.red,
          label: userListController.students.money.toString(),
          borderRadius: BorderRadius.circular(14),
        ),
      ],
    ),
    child: Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        height: 60,
       // width: MediaQuery.of(context as BuildContext).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            const CircleAvatar(
              radius: 50,
              //  backgroundImage: NetworkImage(students.photoProfile as String),
              // backgroundImage: NetworkImage('https://images.outbrainimg.com/transform/v3/eyJpdSI6ImYwY2QxYTBjMDQzYzI2M2Y0Zjk3OTEyMjg3OGZlMjM0ZmMyMjRkYmEwNWZiMzAzNTk3ZWQyYzZkMmJlNzQ0YzkiLCJ3IjozMDAsImgiOjIwMCwiZCI6Mi4wLCJjcyI6MCwiZiI6NH0.webp'),),
            ),
            const SizedBox(
              width: 4,
            ),
            //#surname
            Text(
              userListController.students.surname??"",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 7,
            ),
            //#name
            Text(
              userListController.students.name??"",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}