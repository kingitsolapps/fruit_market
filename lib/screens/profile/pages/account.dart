import 'package:flutter/material.dart';
import 'package:fruit_market/screens/profile/components/profile_menu.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Setting'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // ProfilePic(),
            // SizedBox(height: 20),
            ProfileMenu(
              text: "Security",
              icon: "assets/icons/secure.svg",
              press: () => {
                Get.to(
                  Account(),
                ),
              },
            ),

            ProfileMenu(
              text: "Deactivate Account",
              icon: "assets/icons/cancel.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Delete Account",
              icon: "assets/icons/delete.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
