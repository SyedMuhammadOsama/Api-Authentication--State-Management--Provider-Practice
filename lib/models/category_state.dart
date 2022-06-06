import 'package:api_authentication_and_form_validation/models/all_categories_parsed_api.dart';
import 'package:flutter/cupertino.dart';

class CategoryState extends ChangeNotifier {
  AllCategoriesParsedApi? allCategories;
  updateCategory(AllCategoriesParsedApi newCategories) {
    allCategories = newCategories;
    notifyListeners();
  }
}
