import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/mainSceen/main.dart';
import 'package:gennis_innovative_school/pages/profilePage/main_profile_page.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';

import '../../model/fake_user.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({Key? key}) : super(key: key);

  static const String id = "entrancePage";

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  var list = [
    User("English", "Standart", ProjectImages.book),
    User("English", "Primium", ProjectImages.book),
    User("English", "Golden", ProjectImages.book),
    User("English", "Standart", ProjectImages.book),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF00C2FF),
        elevation: 0,
        // centerTitle: true,
        // bottomOpacity: 20.0,
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
              child: const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.black26,
                backgroundImage: NetworkImage("https://www.pngitem.com/pimgs/m/106-1068071_black-person-png-black-man-business-png-transparent.png"),
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listOfGroup(list[index]);
        },
      ),
    );
  }

  Widget _listOfGroup(User user) {
    return Card(
      elevation: 0,
      //#image
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MainPage.id);
        },
        child: Container(
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                  image: AssetImage(user.image!), fit: BoxFit.cover)),
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
                    user.subject!,
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
                    user.title!,
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
