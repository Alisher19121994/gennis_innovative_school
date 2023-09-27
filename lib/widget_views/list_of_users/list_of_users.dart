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
        students.money! > 0
            ? SlidableAction(
          onPressed: (BuildContext context) {},
          flex: 3,
          backgroundColor: Colors.green,
          label: students.money.toString(),
          borderRadius: BorderRadius.circular(8),
        )
            : SlidableAction(
          onPressed: (BuildContext context) {},
          flex: 3,
          backgroundColor: Colors.red,
          label: students.money.toString(),
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    ),
      child: Card(
        color: const Color(0xFFE1E8ED),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
            Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              color:  Color(0xFFE1E8ED)
            ),
            child: CachedNetworkImage(
              imageUrl: '',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,),
            ),
          ),
              const SizedBox(width: 13,),
              //#surname
              Text(students.surname??"", style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis
              ),
              const SizedBox(width: 7,),
              //#name
              Text(students.name??"", style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
  );
}