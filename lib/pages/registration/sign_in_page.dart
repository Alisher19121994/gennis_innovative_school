import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/pages/entrancePage/entarnce_page.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = "signIn";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  late String username;
  late String password;
  var isLoading = false;
  bool passwordVisible=false;


  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF00C2FF),
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(ProjectImages.fullLogo)
              ),
              const SizedBox(
                height: 26,
              ),
              Container(
                  height: 350,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //#sign in text
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        //#username
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.perm_identity,
                                color: Colors.black,
                              ),
                              labelText: 'Username',
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Username must not be empty';
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() => username = value),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        //#password
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: passwordVisible,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                  passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                              prefixIcon: const Icon(
                                Icons.lock_open_rounded,
                                color: Colors.black,
                              ),
                              labelText: 'Password',
                              border: const OutlineInputBorder()
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Password must not be empty';
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() => password = value),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00C2FF),
                            ),
                              onPressed: (){
                              final isValid = formKey.currentState!.validate();
                              if(isValid){
                                Navigator.pushReplacementNamed(context, EntrancePage.id);
                              }
                              },
                              child:const Text("Submit",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),)
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
