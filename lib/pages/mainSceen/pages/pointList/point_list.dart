import 'dart:convert';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../network/sharedPreferenceData/shared_preference_data.dart';
import '../usersList/model/users.dart';

class PointList extends StatefulWidget {
  final int ids;
  const PointList({Key? key, required this.ids}) : super(key: key);

 static const String id = "PointList";
  @override
  State<PointList> createState() => _PointListState();
}
class _PointListState extends State<PointList> {

  var isLoading = false;

  var logger = Logger();
  Students students= Students();
  UserList usersList = UserList();
  List<Students> listOfUsers = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData()async{
    setState(() {
      isLoading = true;
    });
    var logger = Logger();
    var token = await SharedPreferenceData.getToken();
    final response = await http.get(
        Uri.parse('http://176.96.243.55/api/group_profile/${widget.ids}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );
    final Map<String,dynamic> body = jsonDecode(response.body.toString());
    final UserList userList = UserList.fromJson(body);

    logger.i(body);

    setState(() {
      listOfUsers = userList as List<Students>;
      isLoading = false;
    });
  }
  Future<String?> ratingUser() async {
    final response = await http.post(
      Uri.parse('http://176.96.243.55/api/make_attendance'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        //'isTypeChecked': students.isTypeChecked,
      }),
    );
    var logger = Logger();
    if (response.statusCode == 200) {
      logger.i(response.body);
      return response.body;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:[
          ListView.builder(
            shrinkWrap: true,
            itemCount: listOfUsers.length,
            itemBuilder:(BuildContext context,int index){
              return Card(
                child: ListTile(
                  leading: CircleAvatar(radius: 50,backgroundImage: NetworkImage(listOfUsers[index].photoProfile??''),),
                  title: Text(listOfUsers[index].surname??'',style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  subtitle: Text(listOfUsers[index].name??'',style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                  trailing: RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 44,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.9),
                    itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber,),
                    onRatingUpdate: (rating) {
                      print(rating.toInt());
                      //listOfUsers[index].money = rating.toInt();
                    },
                  ),
                ),
              );
            },
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : const SizedBox.shrink(),
        ]
      ),
    );
  }
}


