import 'package:flutter/material.dart';
import 'package:fruit_market/constants.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
}
