import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/sign_in.dart';
import '../../network/sharedPreferenceData/shared_preference_data.dart';
import '../../networkService/network_service.dart';
import '../../pages/entrancePage/entarnce_page.dart';
import '../../pages/registration/model/login_response.dart';
import '../../pages/registration/model/sign_in.dart';
import '../../projectImages/projectImages.dart';

Widget signIn(BuildContext context,SignInController controller){
  return  Form(
    key: controller.formKey,
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
        //#username & password
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
            child: Stack(
                children:[
                  Column(
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
                        controller: controller.controllerUsername,
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
                        onChanged: (value) =>{
                         controller.username = value,
                          controller.isValidLogin(controller.username)
                        }
                      ),
                      const SizedBox(
                        height: 13,),
                      //#password
                      TextFormField(
                        controller: controller.controllerPassword,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: controller.passwordVisible,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                  controller.passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                              onPressed: () {
                                  controller.passwordVisible = !controller.passwordVisible;
                                  controller.isValidPassword(controller.passwordVisible);

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
                        onChanged: (value) => {
                      controller.password = value,
                      controller.isValidLogin(controller.password)
                      }
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
                            onPressed: () async {
                              final isValid = controller.formKey.currentState!.validate();
                              var logger = Logger();
                              LoginResponse loginResponse = LoginResponse();
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              var status = prefs.getBool('success') ?? false;
                              if(isValid) {
                                LogIn logIn = LogIn(username: controller.username, password: controller.password);
                                NetworkService.loginUser(logIn).then((response) => {
                                  if(status == false){
                                    controller.dialogBuilder(context),
                                  },
                                  if(response != null){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const EntrancePage())),
                                    loginResponse = LoginResponse.fromJson(jsonDecode(response)),
                                    logger.d(response),
                                    SharedPreferenceData.setLoggedIn(loginResponse),
                                    SharedPreferenceData.setToken(loginResponse),
                                    SharedPreferenceData.setId(loginResponse),
                                    SharedPreferenceData.setRefreshToken(loginResponse)
                                  }
                                }
                                );
                              }
                            },
                            child:const Text("Submit",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),)
                        ),
                      ),

                    ],
                  ),
                  controller.isLoading ? const Center(
                      child: CircularProgressIndicator()
                  )
                      :const SizedBox.shrink()
                ]
            ),
          ),
        ),
      ],
    ),
  );
}