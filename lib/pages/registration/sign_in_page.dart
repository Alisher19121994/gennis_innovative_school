import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gennis_innovative_school/network/network.dart';
import 'package:gennis_innovative_school/network/sharedPreferenceData/shared_preference_data.dart';
import 'package:gennis_innovative_school/networkService/network_service.dart';
import 'package:gennis_innovative_school/pages/registration/model/login_response.dart';
import 'package:gennis_innovative_school/pages/registration/model/sign_in.dart';
import 'package:gennis_innovative_school/projectImages/projectImages.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../entrancePage/entarnce_page.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = "signIn";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';

  var isLoading = false;
  bool passwordVisible=false;

  var logger = Logger();

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

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
                              controller: controllerUsername,
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
                              controller: controllerPassword,
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
                                  onPressed: () async {
                                    final isValid = formKey.currentState!.validate();
                                    var logger = Logger();

                                    LoginResponse loginResponse = LoginResponse();
                                    if(isValid) {
                                      LogIn logIn = LogIn(username: username, password: password);

                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const EntrancePage()));
                                      NetworkService.loginUser(logIn).then((response) => {
                                        if(response != null){
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
                        isLoading ? const Center(
                            child: CircularProgressIndicator()
                        )
                            :const SizedBox.shrink()
                      ]
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
class RefreshTokenData {
  static final String baseUrl = "http://176.96.243.55/api/";
  static final String access_token = "";
  static final int id = 0;
  static final int location_id = 0;
  static final String name = "";
  static final String refresh_token = "";
  static final String role = "";
  static final String surname = "";
  static final String username = "";

  final String _accessToken;
  final String _refreshToken;

  RefreshTokenData(this._accessToken, this._refreshToken);

  Future<http.Response> get(String endpoint) async {
    final response = await http.get(
      Uri.parse("$baseUrl$endpoint"),
      headers: {"Authorization": "Bearer $_accessToken"},
    );

    if (response.statusCode == 401) {
      // Access token expired, use the refresh token to get a new one
      final newAccessToken = await _getNewAccessToken();
      final newResponse = await http.get(
        Uri.parse("$baseUrl$endpoint"),
        headers: {"Authorization": "Bearer $newAccessToken"},
      );
      return newResponse;
    } else {
      return response;
    }
  }

  Future<String> _getNewAccessToken() async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      body: {
        "access_token": access_token,
        "id": id,
        "location_id": location_id,
        "name": name,
        "refresh_token": _refreshToken,
        "role": role,
        "surname": surname,
        "username": username,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["access_token"];
    } else {
      throw Exception("Failed to get new access token");
    }
  }
}
// class MyApiClient {
//   static final String baseUrl = "https://example.com/api/v1";
//   static final String clientId = "your-client-id";
//   static final String clientSecret = "your-client-secret";
//
//   final String _accessToken;
//   final String _refreshToken;
//
//   MyApiClient(this._accessToken, this._refreshToken);
//
//   Future<http.Response> get(String endpoint) async {
//     final response = await http.get(
//       Uri.parse("$baseUrl$endpoint"),
//       headers: {"Authorization": "Bearer $_accessToken"},
//     );
//
//     if (response.statusCode == 401) {
//       // Access token expired, use the refresh token to get a new one
//       final newAccessToken = await _getNewAccessToken();
//       final newResponse = await http.get(
//         Uri.parse("$baseUrl$endpoint"),
//         headers: {"Authorization": "Bearer $newAccessToken"},
//       );
//       return newResponse;
//     } else {
//       return response;
//     }
//   }
//
//   Future<String> _getNewAccessToken() async {
//     final response = await http.post(
//       Uri.parse("$baseUrl/token"),
//       body: {
//         "grant_type": "refresh_token",
//         "client_id": clientId,
//         "client_secret": clientSecret,
//         "refresh_token": _refreshToken,
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data["access_token"];
//     } else {
//       throw Exception("Failed to get new access token");
//     }
//   }
// }