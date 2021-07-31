import 'package:flutter/material.dart';
import 'package:fruit_market/constants.dart';
import 'package:fruit_market/screens/cart/cart_screen.dart';
import 'package:fruit_market/screens/home/components/categories/home.dart';
import 'package:fruit_market/screens/home/components/categories/vegetables.dart';
import 'package:fruit_market/screens/notifications/notification_screen.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';

import 'components/body.dart';
import 'components/icon_btn_with_counter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // backgroundColor: kPrimaryColor,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fruit Market',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconBtnWithCounter(
                        svgSrc: "assets/icons/Cart Icon.svg",
                        press: () =>
                            Navigator.pushNamed(context, CartScreen.routeName),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconBtnWithCounter(
                        svgSrc: "assets/icons/Bell.svg",
                        numOfitem: 3,
                        press: () {
                          Get.to(
                            NotificationScreen(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              elevation: 0,
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    text: 'Home',
                  ),
                  Tab(
                    text: 'Vegetables',
                  ),
                  Tab(
                    text: 'Fruits',
                  ),
                  Tab(
                    text: 'Dry-Druits',
                  ),
                ],
              ),
            ),
          ],

          // ),
          body: TabBarView(
            children: [
              Home(),
              Vegetables(category: 'Vegetables'),
              Vegetables(category: 'Fruits'),
              Vegetables(category: 'Dry-Fruits'),
            ],
          ),
          // Body(),
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}
