import 'dart:convert';

import 'package:api_authentication_and_form_validation/models/all_categories_parsed_api.dart';
import 'package:api_authentication_and_form_validation/models/categories_data.dart';
import 'package:api_authentication_and_form_validation/models/category_state.dart';
import 'package:api_authentication_and_form_validation/models/login_state.dart';
import 'package:api_authentication_and_form_validation/models/sign_in_api_parsed.dart';
import 'package:api_authentication_and_form_validation/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  // void initState() {
  //   // getCategory();

  //   super.initState();
  // }

  List<CategoriesData>? categoriesData;
  call() async {
    var apiResponse = await getCategory();
    await Provider.of<CategoryState>(context, listen: false)
        .updateCategory(apiResponse);
  }

  Future<AllCategoriesParsedApi> getCategory() async {
    var url = Uri.parse('http://ishaqhassan.com:2000/category');
    var response = await http.get(url, headers: {
      'Authorization':
          Provider.of<LoginState>(context).parsedData?.data?.accessToken ?? ''
    });
    var categoriesResponse =
        AllCategoriesParsedApi.fromJson(jsonDecode(response.body));
    return categoriesResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('error'),
      ),
      body: ListView.builder(
          itemCount:
              Provider.of<CategoryState>(context).allCategories?.data?.length ??
                  0,
          itemBuilder: ((context, index) => ListTile(
                title: Text(Provider.of<CategoryState>(context)
                        .allCategories
                        ?.data?[index]
                        .title ??
                    'Title'),
                leading: Image.network(Provider.of<CategoryState>(context)
                        .allCategories
                        ?.data?[index]
                        .icon ??
                    'http://ishaqhassan.com:2000/assets/images/categories/beverage.png'),
                subtitle: Text((Provider.of<CategoryState>(context)
                        .allCategories
                        ?.data?[index]
                        .id)
                    .toString()),
              ))),
    );
  }

  @override
  void didChangeDependencies() {
    call();
    super.didChangeDependencies();
  }
}
