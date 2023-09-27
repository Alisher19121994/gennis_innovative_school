import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/entrancePage/entarnce_page.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';
import 'package:http/http.dart' as http;
import '../../controller/splash_page.dart';

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
    Get.find<SplashController>().hasLoggedInByUser();
  }



  Future<void> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        runApp(MaterialApp(home: status == true ? const EntrancePage() : const SignIn()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C2FF),
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller){
          return Stack(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(100),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ProjectImages.allLogo),
                      )),
                ),
              ),
              controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
