import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/usersList/model/users_list_entity.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../../../network/sharedPreferenceData/shared_preference_data.dart';
import 'model/users.dart';

class UsersList extends StatefulWidget {
   final int getId;

  const UsersList({Key? key, required this.getId,}) : super(key: key);
  static const String id = "usersList";

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {


  var isPaid = true;
  var isLoading = false;


  var logger = Logger();
  UsersListDataStudents usersListDataStudents= UsersListDataStudents();
  UsersListEntity usersListEntity = UsersListEntity();
  List<UsersListDataStudents> listOfUsers = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData()async{
    var logger = Logger();
    var token = await SharedPreferenceData.getToken();
    final response = await http.get(
        Uri.parse('http://176.96.243.55/api/group_profile/${widget.getId}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );
    final Map<String,dynamic> body = jsonDecode(response.body);
    final UsersListEntity usersList = UsersListEntity.fromJson(body);

    logger.i(body);

    setState(() {
      //usersListEntity = usersList;
      isPaid == true;
      //isLoading = true;
      listOfUsers = usersList as List<UsersListDataStudents>;
    });
    // if(body != null){
    //   setState(() {
    //     isLoading = false;
    //   });
    // }else{
    //   setState(() {
    //     isLoading = false;
    //   });
    // }

    if(usersListDataStudents.money > 0 ){
      setState(() {
        isPaid == true;
      });
    }else{
      setState(() {
        isPaid == false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //#group overall views in the basic schedule
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.lightBlueAccent),
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(16),
                height: 270,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Educational language",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          usersListEntity.data.information.eduLang.value,
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Course type",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          usersListEntity.data.information.groupCourseType.value,
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Group's name",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          usersListEntity.data.information.groupName.value,
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Group's price",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          usersListEntity.data.information.groupPrice.value.toString(),
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Student's number",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          usersListEntity.data.information.studentsLength.value.toString(),
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Teacher's name",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          usersListEntity.data.information.teacherName.value,
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Teacher's lastName",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          usersListEntity.data.information.teacherSurname.value,
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text(
                          "Holder",
                          style: TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          usersListEntity.data.information.teacherSalary.value.toString(),
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //#group students list with their monthly payment schedule which is shown,once the user swipes from left to right
              // Expanded(
              //     child: ListView.builder(
              //       shrinkWrap: true,
              //       itemCount: listOfUsers.length,
              //       itemBuilder:(BuildContext context,int index){
              //       return _listOfUsers(listOfUsers[index] as UsersListDataStudents);
              //     },
              //   ),
              // )
            ],
          ),
      ),
    );

  }

  Widget _listOfUsers(UsersListDataStudents usersListDataStudents) {
    return Slidable(
      enabled: true,
      direction: Axis.horizontal,
      closeOnScroll: true,
      endActionPane: ActionPane(
        extentRatio: 0.30,
        motion: const ScrollMotion(),
        children: [
          isPaid
              ? SlidableAction(
                  onPressed: (BuildContext context) {},
                  flex: 3,
                  backgroundColor: Colors.green,
                  label: usersListDataStudents.money.toString(),
                 // label: '350.000',
                )
              : SlidableAction(
                  onPressed: (BuildContext context) {},
                  flex: 3,
                  backgroundColor: Colors.red,
                //  label: '-350.000',
                  label: usersListDataStudents.money.toString(),
                  borderRadius: BorderRadius.circular(14),
                ),
        ],
      ),
      child: Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              const CircleAvatar(
                radius: 50,
               // backgroundImage: NetworkImage(usersListDataStudents.photoProfile.toString()),
                backgroundImage: NetworkImage('https://images.outbrainimg.com/transform/v3/eyJpdSI6ImYwY2QxYTBjMDQzYzI2M2Y0Zjk3OTEyMjg3OGZlMjM0ZmMyMjRkYmEwNWZiMzAzNTk3ZWQyYzZkMmJlNzQ0YzkiLCJ3IjozMDAsImgiOjIwMCwiZCI6Mi4wLCJjcyI6MCwiZiI6NH0.webp'),),
             // ),
              const SizedBox(
                width: 4,
              ),
              Text(
                usersListDataStudents.surname,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                usersListDataStudents.name,
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
}
