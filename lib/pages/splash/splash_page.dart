import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/registration/sign_in_page.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String id = "splashPage";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => const SignIn()),
                (route) => false));

    return Scaffold(
      backgroundColor: const Color(0xFF00C2FF),
      body: Center(
        child: Container(
         margin: const EdgeInsets.all(100),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ProjectImages.allLogo),
            )
          ),
        ),
      ),
    );
  }
}
