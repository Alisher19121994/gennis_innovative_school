import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/controller/sign_in.dart';
import 'package:gennis_innovative_school/widget_views/sign_in/sign_in.dart';
import 'package:get/get.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = "signIn";

  @override
  State<SignIn> createState() => _SignInState();
}
class _SignInState extends State<SignIn> {

  @override
  void initState() {
    super.initState();
    Get.find<SignInController>().isLoggedInUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C2FF),
      body: GetBuilder<SignInController>(
        init: SignInController(),
        builder: (controller){
          return signIn(context, controller);
        },
      ),
    );

  }

}