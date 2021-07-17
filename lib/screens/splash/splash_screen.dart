import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_market/constants.dart';
import 'components/splash_body.dart';
// import './size_config.dart';
import 'package:get/get.dart';

import '../../size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Get.offAll(
        SplashBody(),
      ),
    );
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        padding: EdgeInsets.all(0),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Fruit Market',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
            // Spacer(),
            Container(
              width: Get.width,
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.fill,
              ),
            ),
            // Image.asset('asstes/images/splash.png'),
          ],
        ),
      ),
      // Body(),
    );
  }
}
