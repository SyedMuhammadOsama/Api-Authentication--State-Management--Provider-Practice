import 'package:api_authentication_and_form_validation/models/category_state.dart';
import 'package:api_authentication_and_form_validation/models/login_state.dart';
import 'package:api_authentication_and_form_validation/models/sign_in_api_parsed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginState(),
        ),
        ChangeNotifierProvider(create: (_) => CategoryState())
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
