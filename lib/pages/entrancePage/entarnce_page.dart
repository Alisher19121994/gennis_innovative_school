import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/groupPage/group_Page.dart';
import 'package:gennis_innovative_school/pages/mainSceen/main.dart';
import 'package:gennis_innovative_school/pages/mainSceen/pages/createList/create_list.dart';
import 'package:gennis_innovative_school/pages/profilePage/main_profile_page.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import 'model/groups_data.dart';
import 'model/subModel/refresh_token.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key? key}) : super(key: key);

  static const String id = "entrancePage";

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  List<Groups> list = [];
  var isLoading = false;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

   newToken()async {
    final authToken = AuthToken(
      accessToken: 'initial_access_token',
      refreshToken: 'refresh_token',
      expiryTime: DateTime.now().add(
          Duration(minutes: 10)), // Set expiry time accordingly
    );

// When making a request that requires an access token, use this code:
    final newAuthToken = await AuthToken.getNewAccessToken(authToken);
    final response = await http.get(
      Uri.parse('https://api.your-app.com/data'),
      headers: {'Authorization': 'Bearer ${newAuthToken.accessToken}'},
    );
  }

   void fetchData()async{
     setState(() {
       isLoading = true;
     });
      var logger = Logger();
      String? token = await SharedPreferenceData.getToken();
      String id = await SharedPreferenceData.getId();
      final response = await http.get(
        Uri.parse('http://176.96.243.55/api/my_groups/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        }
        );
    final Map<String,dynamic> body = jsonDecode(response.body);
    final GroupOfData groupOfData = GroupOfData.fromJson(body);

    logger.i(body);
    setState(() {
      list = groupOfData.groups!;
      isLoading = false;
    });

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
               // Navigator.pushNamed(context,ProfilePage.id );
               // Navigator.push(context, MaterialPageRoute(builder: (_)=>const ProfilePage()));
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ProfilePage()));
              },
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.black26,
                //backgroundImage: NetworkImage("http://176.96.243.55/static/img_folder/photo-1533106418989-88406c7cc8ca.jpg"),
               // backgroundImage: NetworkImage(userProfile.user!.photoProfile!),
                backgroundImage: AssetImage(ProjectImages.mue),
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
              return _listOfGroup(context,list[index]);
            },
          ),
          isLoading ? const Center(
            child: CircularProgressIndicator()
          ) :
          const SizedBox.shrink()
        ],
      )
    );
  }

  Widget _listOfGroup(BuildContext context,Groups groups) {
    return ListTile(
          onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  MainPage(setId: groups.id?? 0)));
          },
        title: Card(
          elevation: 0,
          //#image
          child: Container(
            height: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: const DecorationImage(
                    image: AssetImage(ProjectImages.book), fit: BoxFit.cover)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                      groups.typeOfCourse??"",
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
                      groups.subject??"",
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
        )
    );
  }
}
