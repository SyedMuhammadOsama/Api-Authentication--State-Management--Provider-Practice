import 'package:api_authentication_and_form_validation/models/sign_in_api_parsed.dart';
import 'package:api_authentication_and_form_validation/models/user_data.dart';
import 'package:flutter/cupertino.dart';

class LoginState extends ChangeNotifier {
  SignInApiParsed? parsedData;

  updateState(SignInApiParsed? login) {
    parsedData = login;
    notifyListeners();
  }
}
