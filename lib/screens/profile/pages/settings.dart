import 'package:flutter/material.dart';
import 'package:fruit_market/screens/profile/components/profile_menu.dart';
import 'package:fruit_market/screens/profile/pages/account.dart';
import 'package:fruit_market/screens/profile/pages/change_address.dart';
import 'package:fruit_market/screens/profile/pages/notification_setting.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // ProfilePic(),
            // SizedBox(height: 20),
            ProfileMenu(
              text: "Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {
                Get.to(
                  Account(),
                ),
              },
            ),

            ProfileMenu(
              text: "Notification",
              icon: "assets/icons/Bell.svg",
              press: () {
                Get.to(NotificationSetting());
              },
            ),
            ProfileMenu(
              text: "Language",
              icon: "assets/icons/global.svg",
              press: () {},
            ),

            ProfileMenu(
              text: "Change Address",
              icon: "assets/icons/Location point.svg",
              press: () {
                Get.to(
                  ChangeAddress(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
