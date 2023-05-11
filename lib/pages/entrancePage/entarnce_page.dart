import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/network/network.dart';
import 'package:gennis_innovative_school/pages/mainSceen/main.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/users_list.dart';
import 'package:gennis_innovative_school/pages/profilePage/main_profile_page.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';
import 'package:logger/logger.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:http/http.dart' as http;
import '../../model/fake_user.dart';
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import 'model/main_entrance_group_entity.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key? key}) : super(key: key);

  static const String id = "entrancePage";

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  List<MainEntranceGroupGroups> list = [];
  var isLoading = false;
  var logger = Logger();
  MainEntranceGroupGroups mainEntranceGroupGroups = MainEntranceGroupGroups();

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  void fetchData()async{
      var logger = Logger();
      String token = await SharedPreferenceData.getToken();
      String id = await SharedPreferenceData.getId();
      final response = await http.get(
        Uri.parse('http://176.96.243.55/api/my_groups/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }
        );
    final Map<String,dynamic> body = jsonDecode(response.body);
    final MainEntranceGroupEntity listOfGroups = MainEntranceGroupEntity.fromJson(body);

         logger.i(body);

    setState(() {
      list = listOfGroups.groups;
      isLoading = true;
    });

         if(body != null){
           setState(() {
             isLoading = false;
           });
         }else{
           setState(() {
             isLoading = false;
           });
         }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C2FF),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: 130,
              child: Image.asset(ProjectImages.topLogo),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProfilePage.id);
              },
              // child: CachedNetworkImage(
              //   width: 90,
              //   height: 90,
              //   imageUrl: "http://176.96.243.55/photo-1533106418989-88406c7cc8ca.jpg",
              //  // imageUrl: mainEntranceGroupGroups.teacherImg??'',
              //   placeholder: (context, url) => const CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => const Icon(Icons.error),
              // ),
              child:  const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.black26,
                backgroundImage: NetworkImage("http://176.96.243.55/static/img_folder/photo-1533106418989-88406c7cc8ca.jpg"),
                //backgroundImage: NetworkImage(mainEntranceGroupGroups.teacherImg?? ''),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return _listOfGroup(list[index]);
            },
          ),
          isLoading ? const Center(
            child: CircularProgressIndicator()
          )
              :const SizedBox.shrink()
        ],
      )
    );
  }

  Widget _listOfGroup(MainEntranceGroupGroups mainEntranceGroupGroups) {

    return Card(
      elevation: 0,
      //#image
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(groupId:mainEntranceGroupGroups.id,)));
         // Navigator.pushNamed(context, MainPage.id);
        },
        child: Container(
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: const DecorationImage(
                  image: AssetImage(ProjectImages.book), fit: BoxFit.cover)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.black26
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //#subject
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Text(
                    mainEntranceGroupGroups.typeOfCourse,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //#title
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Text(
                    mainEntranceGroupGroups.subject,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
