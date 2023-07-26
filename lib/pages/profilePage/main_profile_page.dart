import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import 'model/user_profile.dart';
import 'morePage/edit_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const String id = "profilePage";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var logger = Logger();

  // ProfileEntity profile = ProfileEntity();
  UserProfile userProfile = UserProfile();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var logger = Logger();
    var token = await SharedPreferenceData.getToken();
    String id = await SharedPreferenceData.getId();
    final response = await http
        .get(Uri.parse('http://176.96.243.55/api/profile/$id'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final Map<String, dynamic> body = jsonDecode(response.body);
    final UserProfile profileData = UserProfile.fromJson(body);

    logger.i(body);
    setState(() {
      userProfile = profileData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          PopupMenuButton(
            offset: const Offset(0, 40),
            elevation: 2,
            iconSize: 22,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                  child: Column(children: [
                //#edit data
                     Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 24,
                      color: Colors.black.withOpacity(0.60),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, EditData.id);
                      },
                      child: const Text(
                        "Edit profile data",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 15),
                //#logout
                Row(
                  children: [
                    Icon(
                      Icons.logout_sharp,
                      size: 24,
                      color: Colors.black.withOpacity(0.60),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        SharedPreferenceData.removeLoggedIn();
                        SharedPreferenceData.removeToken();
                        SharedPreferenceData.removeId();
                        Navigator.pushReplacement(
                            context, SignIn.id as Route<Object?>);
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    )
                  ],
                )
              ])),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          //#appBar items,photo,fullName
          Container(
            height: 300,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                color: Colors.blue),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //#Reset photo & fullName
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        //#photo changes
                        CircleAvatar(
                          radius: 50,
                          child: Image.network(userProfile.user?.photoProfile ?? '',)
                        ),

                        const SizedBox(
                          height: 13,
                        ),
                        //#name & lastName
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              userProfile.user?.info?.name?.value ?? "",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              userProfile.user?.info?.surname?.value ?? "",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        //#name of job
                        Text(
                          userProfile.user?.typeRole ?? "",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //#teacher details
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Username",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userProfile.user?.info?.username?.value ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Age",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userProfile.user?.info?.age?.value.toString() ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date of birth",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userProfile.user?.info?.birthDate?.value ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Phone number",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        userProfile.user?.info?.phone?.value ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
