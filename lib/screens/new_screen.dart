import 'package:api_authentication_and_form_validation/models/category_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(Provider.of<CategoryState>(context)
                  .allCategories
                  ?.data?[1]
                  .title ??
              'error')),
    );
  }
}
