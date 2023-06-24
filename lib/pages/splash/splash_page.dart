import 'dart:async';
import 'dart:convert';
import 'package:gennis_innovative_school/pages/registration/model/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/entrancePage/entarnce_page.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../network/sharedPreferenceData/shared_preference_data.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String id = "splashPage";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    runApp(MaterialApp(home: status == true ? const EntrancePage(): const SignIn() ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C2FF),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(100),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(ProjectImages.allLogo),
          )),
        ),
      ),
    );
  }

}

