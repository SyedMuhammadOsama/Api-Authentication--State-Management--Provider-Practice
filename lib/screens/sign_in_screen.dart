import 'package:api_authentication_and_form_validation/models/login_state.dart';
import 'package:api_authentication_and_form_validation/screens/categories_screen.dart';
import 'package:api_authentication_and_form_validation/screens/new_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import '/models/sign_in_api_parsed.dart';
import '/models/user_data.dart';

import 'package:http/http.dart' as http;

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

class HomePage extends StatelessWidget {
  UserData? userData;
  Future<SignInApiParsed?> login() async {
    try {
      var url = Uri.parse('http://ishaqhassan.com:2000/user/signin');
      var response = await http.post(url, body: {
        "email": emailController.text,
        "password": passController.text
      });
      var decodedJson = jsonDecode(response.body);
      var loginResponse = SignInApiParsed.fromJson(decodedJson);

      return loginResponse;

      // setState(() {
      //   userData = loginResponse.data;
      // });
    } catch (e) {
      print(e);
    }
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Validatin'),
        ),
        body: Provider.of<LoginState>(context).parsedData == null
            ? Form(
                child: Builder(
                  builder: (context) => Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (textValue) {
                          if (!(textValue!.contains('@')) ||
                              textValue.isEmpty) {
                            return 'Please enter valid informaton';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: passController,
                        validator: (textValue) {
                          if (textValue!.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (Form.of(context)?.validate() ?? false) {
                            var loginResponse = await login();
                            Provider.of<LoginState>(context, listen: false)
                                .updateState(loginResponse);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoriesScreen(),
                              ),
                            );
                          }
                        },
                        child: const Text('save'),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: ElevatedButton(
                child: Text(userData?.accessToken ?? ''),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewScreen(),
                    ),
                  );
                },
              )));
  }
}
