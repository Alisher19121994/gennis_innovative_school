import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users.dart';
import '../../controller/users_list.dart';

Widget listOfUsers(StudentsData students,UserListController userListController) {
  return Slidable(
    enabled: true,
    direction: Axis.horizontal,
    closeOnScroll: true,
    endActionPane: ActionPane(
      extentRatio: 0.25,
      motion: const ScrollMotion(),
      children: [
        userListController.isPaid
            ? SlidableAction(
          onPressed: (BuildContext context) {},
          flex: 3,
          backgroundColor: Colors.green,
          label: students.money.toString(),
        )
            : SlidableAction(
          onPressed: (BuildContext context) {},
          flex: 3,
          backgroundColor: Colors.red,
          label: students.money.toString(),
          borderRadius: BorderRadius.circular(14),
        ),
      ],
    ),
      child: Card(
        color: Colors.cyanAccent,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          height: 60,
         // width: MediaQuery.of(context as BuildContext).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
            Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50)
            ),
            child: CachedNetworkImage(
              imageUrl: userListController.image.toString(),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
              const SizedBox(
                width: 4,
              ),
              //#surname
              Text(
                students.surname??"",
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
                students.name??"",
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