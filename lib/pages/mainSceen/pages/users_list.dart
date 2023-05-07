import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gennis_innovative_school/model/fake_user2.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key}) : super(key: key);
  static const String id = "usersList";

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<UserM> listOfUsers = [];
  var isPaid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.lightBlueAccent),
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Education language",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        "Uzbek",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Course type",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        "Standart",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Group name",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        "IT",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Group price",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        "3500000",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Students number",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        "12",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Teacher name",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        "Alisher",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Teacher lastname",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        "Daminov",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Holder",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                      Text(
                        "1400000",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            _listOfUsers(),
            // ListView.builder(
            //   itemCount: listOfUsers.length,
            //   itemBuilder:(BuildContext context,int index){
            //     return _listOfUsers(listOfUsers[index]);
            //   },
            // ),
          ],
        ));
  }

  Widget _listOfUsers() {
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
                  label: '350.000',
                )
              : SlidableAction(
                  onPressed: (BuildContext context) {},
                  flex: 3,
                  backgroundColor: Colors.red,
                  label: '-350.000',
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
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://images.outbrainimg.com/transform/v3/eyJpdSI6ImYwY2QxYTBjMDQzYzI2M2Y0Zjk3OTEyMjg3OGZlMjM0ZmMyMjRkYmEwNWZiMzAzNTk3ZWQyYzZkMmJlNzQ0YzkiLCJ3IjozMDAsImgiOjIwMCwiZCI6Mi4wLCJjcyI6MCwiZiI6NH0.webp'),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Alisher",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Daminov",
                style: TextStyle(
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
