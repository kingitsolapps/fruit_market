import 'package:flutter/material.dart';
import 'package:fruit_market/providers/userLoginProvider.dart';
import 'package:fruit_market/screens/cart/cart_screen.dart';
import 'package:fruit_market/screens/favourite/favourite_screen.dart';
import 'package:fruit_market/screens/profile/pages/account.dart';
import 'package:fruit_market/screens/profile/pages/help.dart';
import 'package:fruit_market/screens/profile/pages/my_orders.dart';
import 'package:fruit_market/screens/profile/pages/notification_setting.dart';
import 'package:fruit_market/screens/profile/pages/rate_us.dart';
import 'package:fruit_market/screens/profile/pages/settings.dart';
import 'package:provider/provider.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserSignInProvider>(
      builder: (context, signInModal, _) {
        return SingleChildScrollView(
          // padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              ProfilePic(),
              SizedBox(height: 20),
              ProfileMenu(
                text: "My Account",
                icon: "assets/icons/User Icon.svg",
                press: () => {
                  Get.to(
                    Account(),
                  ),
                },
              ),
              ProfileMenu(
                text: "My Orders",
                icon: "assets/icons/Gift Icon.svg",
                press: () => {
                  Get.to(
                    MyOrders(),
                  ),
                },
              ),
              ProfileMenu(
                text: "Favourites",
                icon: "assets/icons/Heart Icon_2.svg",
                press: () => {
                  Get.to(
                    FavouriteScreen(),
                  ),
                },
              ),
              ProfileMenu(
                text: "Notifications",
                icon: "assets/icons/Bell.svg",
                press: () {
                  Get.to(
                    NotificationSetting(),
                  );
                },
              ),
              ProfileMenu(
                text: "Settings",
                icon: "assets/icons/Settings.svg",
                press: () {
                  Get.to(
                    Settings(),
                  );
                },
              ),
              ProfileMenu(
                text: "My Cart",
                icon: "assets/icons/Cart Icon.svg",
                press: () {
                  Get.to(CartScreen());
                },
              ),
              ProfileMenu(
                text: "Rate us",
                icon: "assets/icons/rating.svg",
                press: () {
                  Get.to(RateUs());
                },
              ),
              ProfileMenu(
                text: "Refer a Friend",
                icon: "assets/icons/share.svg",
                press: () {
                  Get.defaultDialog(
                      middleText:
                          'Wait This page is not added. Now working on it.');
                },
              ),
              ProfileMenu(
                text: "Help",
                icon: "assets/icons/Question mark.svg",
                press: () {
                  Get.to(Help());
                },
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () {
                  signInModal.signOutUser();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
