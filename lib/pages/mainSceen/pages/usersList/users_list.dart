import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/users_list.dart';
import 'package:get/get.dart';
import '../../../../widget_views/list_of_users/list_of_Groups.dart';

class UsersList extends StatefulWidget {
  final int ids;

  const UsersList({
    Key? key,
    required this.ids,
  }) : super(key: key);
  static const String id = "usersList";

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  void initState() {
    super.initState();
    Get.find<UserListController>().apiUserListOfTeacher(widget.ids);
    Get.find<UserListController>().apiUserListOfStudents(widget.ids);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<UserListController>(
        init: UserListController(),
        builder: (controller) {
          return listOfGroups(context, controller);
        },
      ),
    );
  }
}
